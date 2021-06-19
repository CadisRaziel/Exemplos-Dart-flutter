
import 'package:doc/filtros/FilterItem.dart';
import 'package:doc/filtros/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;

@immutable
class FilterSelector extends StatefulWidget {

  ///Esses dois finals sao passados como parametro para o home.dart
  final List<Color> filters;
  final void Function(Color selectedColor) onFilterChanged;

  
  final EdgeInsets padding;

  
  const FilterSelector({
    Key? key,
    required this.filters,
    required this.onFilterChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 24.0),
  }) : super(key: key);


  @override
  _FilterSelectorState createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {

  // _filtersPerScreen = vai ser o tamanho das bolinhas dos botoes de filtros, deixe como 5 !!
  static const _filtersPerScreen = 5;

  ///_viewportFractionPerItem = para apresentar os botoes de filtro com uma escala de 1 (o que deixa eles proporcional !)
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  late final PageController _controller;
  late int _page;

  int get filterCount => widget.filters.length;

  Color itemColor(int index) => widget.filters[index % filterCount];

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }


  ///animação que vai realizar ao selecionar outro filtro !!
  void _onFilterTapped(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///Poderiamso colocar um ListView porém o filtro selecionado nao ficaria no centro, ficaria no incio
    ///para podermos deixar o filtro selecionado no centro colocamos o Scrollable
    return Scrollable(
      controller: _controller,
      ///axisDirection = direção da barra de rolagem dos filtros !
      axisDirection: AxisDirection.right,

      ///PageScrollPhysics = Essa física faz com que a visualização da página se ajuste aos limites da página.
      physics: PageScrollPhysics(),
      viewportBuilder: (context, viewportOffset) {

        ///Para fazer a construção do itemSize precisamos envolve-lo em um LayoutBuilder
        return LayoutBuilder(
          builder: (context, constraints) {
            ///O tamanho do círculo seletor e do gradiente de fundo depende do tamanho de um filtro individual no carrossel chamado itemSize
            final itemSize = constraints.maxWidth * _viewportFractionPerItem;
            viewportOffset
              ..applyViewportDimension(constraints.maxWidth)
              ..applyContentDimensions(0.0, itemSize * (filterCount - 1));

            return Stack(
              ///alinhamento dos botões de filtro para pode-los dexa-los no Bottom por isso o 'bottomCenter'
              alignment: Alignment.bottomCenter,
              children: [
                _buildShadowGradient(itemSize),
                _buildCarousel(
                  viewportOffset: viewportOffset,
                  itemSize: itemSize,
                ),
                _buildSelectionRing(itemSize),
              ],
            );
          },
        );
      },
    );
  }

  ///=====================================================================================================================

  Widget _buildShadowGradient(double itemSize) {
    return SizedBox(
      height: itemSize * 2 + widget.padding.vertical,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            ///Essas cores tem que ser transparente se não da conflito com a imagem e ela fica toda com cores erradas
            ///o linearGradient exige que coloque essas cores, então coloque transparent
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
        child: SizedBox.expand(),
      ),
    );
  }

  Widget _buildCarousel({
    required ViewportOffset viewportOffset,
    required double itemSize,
  }) {
    return Container(
      height: itemSize,
      margin: widget.padding,

      ///Usamos o Flow aqui pois ele tem uma propriedade 'delegate' que permite posicionar o widget onde quiser
      ///ou seja posicionamos o filtro selecionado no centro com a ajuda do Scrollable
      child: Flow(
        delegate: CarouselFlowDelegate(
          //as prorpiedades abaixo estão construidas no 'carousel.dart'
          viewportOffset: viewportOffset,
          filtersPerScreen: _filtersPerScreen,
        ),
        children: [
          ///Esse for é para inclusão dos filtro !
          for (int i = 0; i < filterCount; i++)
          
          ///Repare que passamos um VoidCallBack no filterItem.dart
          ///aqui instanciamos a classe FilterItem e como parametro passamos ele que é o onFilterSelected
          ///o onFilterSelected vai receber uma função anonima que é a _onFilterTapped
          ///a _onFilterTapped faz a animação de transição entre os efeitos !
            FilterItem(
              onFilterSelected: () => _onFilterTapped(i),
              color: itemColor(i),
            ),
        ],
      ),
    );
  }

  ///Função que coloca uma borda branca(anel seletor) nos botoes de efeitos !
  Widget _buildSelectionRing(double itemSize) {
    ///IgnorePointer = impede que o widget receba evento de clique
    ///Colocamos ele na 'borda branca(anel seletor) dos botoes' 
    ///porque quando a interatividade do carrossel é adicionada, o anel seletor não deve interferir nos eventos de tocar e arrastar.
    return IgnorePointer(     
      ignoring: true,
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: itemSize,
          height: itemSize,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(width: 6.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


///IgnorePointer
///VoidCallBack
///Scrollable
///PageScrollPhysics
///Stack
///PageController
///AspectRatio
///ClipOval
///BlendMode
///ValueListenableBuilder
///ValueNotifier