
import 'package:doc/RotasGenerationConst/RotasNomeadas.dart';
import 'package:doc/RotasGenerationConst/devicePage.dart';
import 'package:doc/RotasGenerationConst/finishedPage.dart';
import 'package:doc/RotasGenerationConst/waitingPage.dart';
import 'package:flutter/material.dart';

@immutable
/// Pelo que eu entendi o setupFlow é para aceitar as subrotas !

class SetupFlow extends StatefulWidget {

  ///pelo que entendi o findAncestorStateOfType vai retornar seu ancestral o SetupFlow
  ///ele é util para subRotas pois a separação dos widgets
  static SetupFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<SetupFlowState>()!;
  }
  
  final String setupPageRoute;

  const SetupFlow({
    Key? key,
    required this.setupPageRoute,
  }) : super(key: key);


  @override
  SetupFlowState createState() => SetupFlowState();
}

class SetupFlowState extends State<SetupFlow> {


  ///Abaixo temos uma sequencia de rotas aninhadas \/

  ///Repare que criamos essa global Key para atrelar a função 'onGenerationRoute' ao widgt 'WillPopScope'
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  void _onDiscoveryComplete() {
    _navigatorKey.currentState!.pushNamed(routeDeviceSetupSelectDevicePage);
  }

  void _onDeviceSelected(String deviceId) {
    _navigatorKey.currentState!.pushNamed(routeDeviceSetupConnectingPage);
  }

  void _onConnectionEstablished() {
    _navigatorKey.currentState!.pushNamed(routeDeviceSetupFinishedPage);
  }

  Future<void> _onExitPressed() async {
    final isConfirmed = await _isExitDesired();

  ///mounted = Monta o objeto state até que um dispose() seja chamado
  ///ou seja se foi confirmado e a tela de widget esta toda montada ele vai sair
    if (isConfirmed && mounted) {
      _exitSetup();
    }
  }

  ///Caso clicarmos na seta de sair da pagina
  ///vai nos aparecer uma mensagem de aviso informamos se realmente queremos sair (pois pode ocorrer de perder todo o processo)
  ///ou se queremos permanecer na pagina
  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Você tem certeza ?'),
                content: Text(
                    'Se você sair da configuração do dispositivo, seu progresso será perdido'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Sair'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('Ficar'),
                  ),
                ],
              );
            }) 
            ///repare nesse operador ?? que retorna um valor por default
            ///ou seja caso eu clique fora da tela ele vai dar como false (ou seja é o mesmo que 'Ficar')
            ///porem preciso colocar ele pois eu disse que o Future retorna um bool e esse bool returna justamente esse operador !
            ?? false;
  }

  ///função que ao clicar no botão 'terminar' ele vai voltar para a pagina inicial
  void _exitSetup() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ///WillPopScope = para quando usuario clicar na seta de VOLTAR vai apresentar o onWillPop que tem como retorno o showDialog
    return WillPopScope(
      ///pop alert (showDialog)
      onWillPop: _isExitDesired,
      child: Scaffold(
        appBar: _buildFlowAppBar(),
        body: Navigator(
          ///o key: _navigatorKey é quem vai das as intruções para qual pagina deve ir conforme o usuario manusea o app
          key: _navigatorKey,
          initialRoute: widget.setupPageRoute,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case routeDeviceSetupStartPage:
      ///Aqui ele esta procurando uma lampada com um ProgressBarIndicator
        page = WaitingPage(
          message: 'Procurando por uma lâmpada...',
          onWaitComplete: _onDiscoveryComplete,
        );
        break;
        
        ///Aqui ele encontrou uma lampada 
      case routeDeviceSetupSelectDevicePage:
        page = SelectDevicePage(
          onDeviceSelected: _onDeviceSelected,
        );
        break;

        ///Aqui ele vai conectar o aparelho a lampada 
      case routeDeviceSetupConnectingPage:
        page = WaitingPage(
          message: 'Conectando...',
          onWaitComplete: _onConnectionEstablished,
        );
        break;

        ///aqui o processo todo foi concluido e aceito e temos o botão para fechar a pagina
      case routeDeviceSetupFinishedPage:
        page = FinishedPage(
          onFinishPressed: _exitSetup,
        );
        break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  ///Esse appBar vai ser apresentado: 
  ///Na hora que procurar uma lampada
  ///Na hora que encontrar uma lampada e clicarmos na identificação da lampada 
  ///Na hora que aparece 'Lampada adicionada' e o botão para terminar o processo e fechar a tela
  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: _onExitPressed,
        icon: Icon(Icons.chevron_left),
      ),
      title: Text('Configuração da lâmpada'),
    );
  }
  ///PreferredSizeWidget = Utilizamos esse widget para que ele retorne o tamanho padrao de um AppBar ou TabBar
}


/// MOUNTED :
/// Se este objeto [State] está atualmente em uma árvore.
  ///
  /// Depois de criar um objeto [State] e antes de chamar [initState], o
  /// framework "monta" o objeto [State] associando-o a um
  /// [BuildContext]. O objeto [State] permanece montado até o framework
  /// chamadas [dispose], após o qual o framework nunca irá perguntar ao [Estado]
  /// objeto para [construir] novamente.
  ///
  /// É um erro chamar [setState] a menos que [montado] seja verdadeiro.


/// MOUNTED :
/// dica: Esta propriedade é útil quando um método em seu estado é chamado, setState()
///  mas não está claro quando ou com que frequência esse método será chamado. 
/// Talvez esteja sendo chamado em resposta a uma atualização de fluxo.
///  Você pode usar if (mounted) {... para verificar se o estado existe antes de ligar setState().