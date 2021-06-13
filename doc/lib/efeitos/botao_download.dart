import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///possiveis estados visuais do botão
enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

@immutable
class DownloadButton extends StatefulWidget {
  final DownloadStatus status;
  final double progress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  final Duration transitionDuration;

  const DownloadButton({
    Key? key,
    required this.status,
    this.progress = 0.0,
    required this.onDownload,
    required this.onCancel,
    required this.onOpen,
    this.transitionDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  


  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool get _isDownloading => widget.status == DownloadStatus.downloading;

  bool get _isFetching => widget.status == DownloadStatus.fetchingDownload;

  bool get _isDownloaded => widget.status == DownloadStatus.downloaded;

    void _onPressed() {
    switch (widget.status) {
      case DownloadStatus.notDownloaded:
        widget.onDownload();
        break;
      case DownloadStatus.fetchingDownload:
        // do nothing.
        break;
      case DownloadStatus.downloading:
        widget.onCancel();
        break;
      case DownloadStatus.downloaded:
        widget.onOpen();
        break;
    }
  }
  

  ///uma função que retorna um Widget para fazer as funções de pause, cancelar, começar o download ...

  ///uma função que retorna um Widget que vai apresentar um spinner enquanto busca o download
  Widget _buildDownloadingProgress() {
    return Positioned.fill(
        child: AnimatedOpacity(
      duration: widget.transitionDuration,
      opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
      curve: Curves.ease,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildProgressIndicator(),
          if (_isDownloading)
            const Icon(Icons.stop, size: 14, color: CupertinoColors.activeBlue)
        ],
      ),
    ));
  }

  ///uma função que retorna um Widget para se juntar a _buildDownloadProgress para ser incluido o ProgressBarindicator
  Widget _buildProgressIndicator() {
    return AspectRatio(
        aspectRatio: 1,
        child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: widget.progress),
            duration: Duration(milliseconds: 200),
            builder: (BuildContext context, double progress, Widget? child) {
              return CircularProgressIndicator(
                backgroundColor: _isDownloading
                    ? CupertinoColors.lightBackgroundGray
                    : Colors.white.withOpacity(0.0),
                valueColor: AlwaysStoppedAnimation(_isFetching
                    ? CupertinoColors.lightBackgroundGray
                    : CupertinoColors.activeBlue),
                strokeWidth: 2,
                value: _isFetching ? null : progress,
              );
            }));
  }

  ///uma função que retorna um Widget que vai colcoar texto dentro dos botoes
  Widget _buildText() {
    final texto = _isDownloaded ? 'Abrir' : 'Iniciar';
    final opacidade = _isDownloading || _isFetching ? 0.0 : 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: AnimatedOpacity(
        opacity: opacidade,
        duration: widget.transitionDuration,
        curve: Curves.ease,
        child: Text(texto,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.activeBlue,
                )),
      ),
    );
  }

  ///uma função que retorna um Widget que vai fazer a animação do download sendo efetuado
  Widget _buildButtonShape({required Widget child}) {
    return AnimatedContainer(
      duration: widget.transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: _isDownloading || _isFetching
          ? ShapeDecoration(
              shape: const CircleBorder(), color: Colors.white.withOpacity(0.0))
          : const ShapeDecoration(
              shape: StadiumBorder(),
              color: CupertinoColors.lightBackgroundGray),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: _onPressed,
     child: Stack(
       children: [
         _buildButtonShape(
           child: _buildText(),
         ),
         _buildDownloadingProgress(),
       ],
     ),
   );
 }
}

///Porque 'ShapeDecoration'
/*
Você pode se perguntar por que precisa de um ShapeDecoration widget para um círculo transparente, 
visto que ele é invisível. O objetivo do círculo invisível é orquestrar a animação desejada. 
O AnimatedContainer começa com um retângulo arredondado. Quando DownloadStatus muda para fetchingDownload,
o AnimatedContainer precisa ser animado de um retângulo arredondado para um círculo e, 
em seguida, desaparecer à medida que a animação ocorre. 
A única maneira de implementar essa animação é definir a forma inicial de um retângulo arredondado e a forma final de um círculo.
Mas, você não quer que o círculo final seja visível, então você o torna transparente, o que causa um esmaecimento animado.
*/
