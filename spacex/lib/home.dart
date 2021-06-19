import 'package:flutter/material.dart';
import 'package:spacex/core/app_images.dart';
import 'package:spacex/core/app_text_style.dart';
import 'package:spacex/telaSite.dart';

class SpaceX extends StatefulWidget {
  @override
  _SpaceXState createState() => _SpaceXState();
}

class _SpaceXState extends State<SpaceX> {
  void _usandoNavigator() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaSite()));
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Space X', style: AppTextStyles.titleJP),
          centerTitle: true,
          //flexibleSpace para por uma cor gradiente no appbar
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple.shade900, Colors.pink],
                    //begin é aonde vai começar o gradiente
                    begin: Alignment.bottomRight,
                    //end é aonde vai terminar o gradiente
                    end: Alignment.topLeft)),
          ),
          //aqui eu adiciono os icones
          bottom: TabBar(
            //isScrollable = para deixar a os icones com um scroll caso tenha varios
            // isScrollable: true,
            //muda a cor do risco que fica em baixo dos icones
            indicatorColor: Colors.white,
            //deixa a linha que fica em baixo dos icones mais espessa
            indicatorWeight: 3,
            tabs: [
              //tome muito cuidado pois se eu definir LENGTH: 4 ali no incio eu tenho que ter exatamente 4 icones se nao da erro !!!
              Tab(icon: Icon(Icons.face), text: 'Fundador'),
              Tab(icon: Icon(Icons.spa), text: 'Projeto'),
              Tab(icon: Icon(Icons.account_balance_outlined), text: 'Empresa'),
              Tab(icon: Icon(Icons.contact_phone), text: 'Contato'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            fundador(context),
            projetos(context),
            empresa(context),
            contato(context),
          ],
        ),
      ));

  //aqui consegumos criar uma pagina estilo o fragmento do kotlin
  //ou seja criamos uma tela a partir do icone criado
  //com isso conseguimos botar um container com todo tipo de conteudo que uma pagina normal teria !!
  Widget projetos(BuildContext context) => Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      'Projetos',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      AppImages.elon2,
                      height: 750,
                      width: 500,
                    ),
                    Image.asset(
                      AppImages.rocket1,
                      height: 750,
                      width: 500,
                    ),
                    Image.asset(
                      AppImages.nave,
                      height: 750,
                      width: 500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget fundador(BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.fundo),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      AppImages.elon,
                      height: 150,
                      width: 150,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Elon Musk',
                        style: TextStyle(fontSize: 32, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Diferente do que muita gente pensa, Musk não é norte-americano. O empreendedor nasceu em 1971, em Pretória, capital da África do Sul, e foi o típico adolescente introvertido, que gosta de games e livros.Foi pela leitura que aprendeu a programar sozinho e com apenas 12 anos criou seu próprio jogo de computador, o ‘Blastar’, que vendeu posteriormente para a revista “PC and Office Technology” por US\$500.No game, que está disponível online, o jogador controla uma nave espacial e tem que destruir um cargueiro alienígena. É interessante notar que o jovem Musk já mostrava interesse pelo assunto que o tornaria hoje a figura central na mudança do cenário espacial no mundo.Em 1989, aos 17 anos, o futuro bilionário mudou-se para o Canadá e iniciou os estudos na Queen’s University, em Kingston, Ontário. Dois anos depois, mudou-se para a Philadelphia, nos EUA, onde se formou em economia pela Wharton School e em física pelo College of Arts and Sciences.Foi quando ainda estava na Philadelphia, em 1995, que Musk criou a empresa que renderia a ele os primeiros milhões da carreira: a Zip2, fundada em parceria com o seu irmão, Kimbal Musk. A ideia da companhia era oferecer a jornais online um guia de cidades baseado em informações na web.Apesar de parecer uma proposta simples em 2020, a companhia foi considerada inovadora na época. A Zip2 convenceu investidores e em 1999 foi comprada pela Compaq, uma grande empresa de computadores, por US\$307 milhões. O atual CEO da SpaceX tinha apenas 28 anos de idade.Depois do guia de cidades para jornais, Musk ajudou a criar um outro grande projeto de sucesso. Em 1999, o empresário fundou a X.com, companhia de serviços financeiros online. No ano seguinte, a empresa se uniu com a Confinity, empresa de transações financeiras que deu origem à famosa Paypal.Musk era o maior acionista e CEO da X.com. Entretanto, devido a desentendimentos com os demais líderes, foi destituído da empresa em outubro de 2000, mesmo assim continuou tendo posse de grande parte dos papéis da startup. Em outubro de 2002, a Ebay comprou a Paypal por US\$1,5 bilhão. Dessa quantia, o atual CEO da Tesla recebeu US\$165 milhões.Apesar de ter sido expulso da empresa após brigas com o conselho, tudo indica que Elon Musk nunca se desligou emocionalmente da companhia de pagamentos online. No ano de 2017, o excêntrico bilionário recomprou o domínio “X.com”, que desde sua saída, em 2000, estava sob posse da Paypal.Em post no twitter, Elon Musk chegou a agradecer à gigante dos pagamentos eletrônicos por vender a ele o domínio. “Tem um grande valor sentimental para mim”, disse na publicação. Atualmente, quem acessar a X.com encontrará uma página em branco, com um pequeno ‘x’ no canto superior esquerdo da tela.SpaceX e Tesla Motors: nasce o ‘Homem de Ferro’Com US\$ 100 milhões da sua fortuna, acumulada nos empreendimentos Zip2 e X.com, Musk fez seu sonho de infância se tornar realidade. A materialização do game ‘Blaster’ veio no ano 2000, com a criação da empresa Space Exploration Technologies, conhecida pelo nome fantasia SpaceX.O objetivo, que teve seu primeiro passo alcançado no último sábado, era baratear os custos com viagens espaciais. Os foguetes Falcon 1 e Falcon 9 foram lançados pela primeira vez em 2006 e 2010, respectivamente.Em 2011, a SpaceX foi a primeira empresa a vender um voo comercial à Lua, por meio do foguete Grasshopper, nave reutilizável que poderia retornar à base após o lançamento. O primeiro passageiro será o bilionário Japonês Yusaku Maezawa e a ‘viagem’ está prevista para 2023. Todas as três naves tiveram seus designs chefiados por Elon Musk.Já a Tesla Motors, fundada em 2003 pelos engenheiros Martin Eberhard e Marc Tarpenning, é uma companhia pioneira na fabricação de carros eletrônicos, da qual Musk foi um dos primeiros funcionários e investidores. O bilionário investiu cerca de US\$ 7,5 milhões na empresa em 2004 e virou presidente do conselho no mesmo ano e CEO em 2008.O primeiro modelo fabricado pela empresa foi o Roadster, um carro esportivo que rodava até 350 quilômetros em uma carga de bateria. Toda tecnologia foi feita do zero, para não ter que pagar patentes de outras marcas. Em seguida a Tesla lançou o Model S, que se tornou o segundo carro elétrico mais vendido do mundo, e o Model X.No entanto, nem tudo foi fácil nos negócios. Em 2008, no primeiro ano como CEO da Tesla, ocorreu uma grande crise econômica nos EUA, considerada até então a maior desde a Grande Depressão. A fabricante de carros elétricos e a SpaceX tiveram a um fio de falirem, quando próximo ao Natal, Musk fechou um investimento de US\$40 milhões de dólares que salvou as empresas.Mesmo em meio à pandemia do coronavírus, as empresas de Musk não deixaram de lucrar. Hoje, três anos após dar lucro pela primeira vez, o valor de mercado da Tesla atingiu US\$100 bilhões, ultrapassando o valor da Ford, General Motors, Fiat-Chrysler e Daimler juntas.A frente dessas duas grandes empresas inovadoras, Elon Musk ganhou notoriedade e fãs nas redes, que passaram a compará-lo com o Homem de Ferro, bilionário e gênio da tecnologia nos quadrinhos.Bônus de US\$ 700 milhões e US\$0 investidos em publicidade.No Vale do Silício é comum que os CEOs das grandes empresas ganhem um salário anual simbólico de US\$1. Elon Musk decidiu fazer diferente e baixou seu salário anual para US\$0, ou seja, viverá integralmente e oficialmente do lucro que seus empreendimentos proporcionarem.Na Tesla, por exemplo, o CEO tem direito a 12 bônus conforme algumas metas de desempenho da empresa sejam alcançadas. Na semana passada, Musk conseguiu atingir a primeira meta após a montadora chegar a US\$20 bilhões em receita e US\$100 bilhões em valor de mercado.Com a façanha, o empresário desbloqueou a primeira parcela do pagamento, que deve render ao já bilionário mais US\$700 milhões. Isso porque, no primeiro bônus, a empresa oferece opções de compras no valor de US\$1,7 milhão em papéis da empresa ao CEO, no valor de 350 dólares cada. Às 16h59 desta segunda-feira (01), uma ação da Tesla valia US\$898,10.Além do bônus milionário, Musk deve encarar um novo desafio com a fabricante de carros eletrônicos. Um dos acionistas, James Danforth, detentor de 850 ações da empresa, propôs ao CEO que investisse pelo menos US\$50 por carro produzido em publicidade.A ideia é finalmente trabalhar o marketing dos carros elétricos, já que diferente dos concorrentes, a Tesla nunca gastou US\$1 com marketing e anúncio dos veículos. De acordo com os argumentos de Danforth, essa situação vem deixando os investidores inseguros, a medida que a empresa anunciou fechamento das lojas de varejo no 1º trimestre de 2019 e concentração das vendas pelo site.O Conselho da Tesla já se posicionou contra a proposta, que será apreciada pelos demais acionistas em julho, e mencionou que os prêmios ganhos pela montadora são a principal forma de divulgação dos carros. A companhia, na verdade, aposta em propaganda alternativa, focada na figura de Elon Musk, e também na venda direta dos automóveis.No mesmo ritmo em que ascendia nos negócios, Elon Musk colecionou polêmicas de todos os tipos. Vários funcionários da fábrica da Tesla em Freemont, Califórnia, em diferentes momentos, denunciaram a empresa por racismo, machismo, homofobia, capacitismo (preconceito contra deficientes físicos), assédio sexual, intimidação, exploração de mão de obra estrangeira barata e até de roubo de direitos de imagem.O conteúdo das denúncias era, no geral, o mesmo: após sofrer algum tipo de preconceito dentro da Tesla, o funcionário não só era desacreditado, como demitido posteriormente. Em um dos casos, a engenheira AJ Vandermeyden acusou a empresa de ignorar os relatos de assédio sexual feitos por ela e ainda pagá-la um salário menor que os demais funcionários homens na mesma função.Em resposta ao The Guardian, Musk disse por e-mail que “nós tivemos alguns casos na Tesla onde alguém de um grupo pouco representado conseguiu um emprego ou foi promovido em meio a candidatos mais representados e, então, decidiram processar a Tesla em milhões de dólares porque eles sentiam que eles não foram promovidos o suficiente. Isso obviamente não é legal.Fora do âmbito das subsequentes denúncias de discriminação, o CEO da Tesla e SpaceX também já derrubou as ações da empresa, mais de uma vez, fazendo um simples tuíte. Na manhã do dia 06/05, Elon Musk postou uma série de mensagens no Twitter em que afirmava que os papéis da montadora estavam altos demais e que tinha planos para se livrar da maioria dos seus bens físicos. Por volta das 12h daquele dia, as ações caíram mais de 11%.Em outras ocasiões, como na vez em que postou na mesma rede social que iria fechar o capital da Tesla Motors por US\$420 por ação, Musk e a Tesla chegaram a ser multados em US\$20 milhões cada. O CEO também foi afastado do Conselho da companhia pela SEC, a CVM americana.As últimas declarações polêmicas do ex-adolescente nerd foram em relação ao isolamento social, necessário para combater o coronavírus, e o explícito apoio ao presidente Donald Trump. Quando os EUA já contavam milhares de mortos, Musk qualificou as medidas de distanciamento social como ‘fascistas’ e chegou a mencionar que a Tesla iria abrir sua fábrica na Califórnia, mesmo com as regras da região proibindo a reabertura',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget empresa(BuildContext context) => Container(      
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(
                    'A Space Exploration Technologies Corp., ou SpaceX, foi fundada em 2002, nos Estados Unidos, por Elon Musk. Hoje, a companhia é uma das principais empresas privadas de serviços de transporte espacial do mudo. Nascida com a missão de revolucionar a tecnologia espacial, a SpaceX projeta, fabrica e lança foguetes que, atualmente, entregam cargas na órbita terrestre. Apesar disso, o foco principal da companhia é permitir que as pessoas possam habitar outros planetas. Para alcançar seu principal objetivo, a empresa tem trabalhado para que o turismo espacial se torne realidade em breve, através da construção de foguetes reutilizáveis, como a família Falcon e a cápsula Dragon. A SpaceX ganhou destaque internacional depois de ter sido responsável pelo primeiro foguete de combustível líquido a chegar à órbita da Terra com financiamento privado, ser a primeira empresa privada a transportar mantimentos para a Estação Espacial Internacional e a primeira empresa a conseguir fazer a reutilização de um foguete orbital.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
      );

  Widget contato(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.logospaceX),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Center(
          child: Column(
            children: [            
                  Text('Contato', style: TextStyle(fontSize: 30),)
            ],
          ),
        ),
      );
}
