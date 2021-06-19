import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notion/core/app_color.dart';
import 'package:notion/core/app_text_style.dart';
import 'package:notion/error/Failure_model.dart';
import 'package:notion/graphic_design/spending_chart.dart';
import 'package:notion/model/item_model.dart';
import 'package:notion/model/repository_model.dart';

class Financa extends StatefulWidget {
  const Financa({Key? key}) : super(key: key);

  @override
  _FinancaState createState() => _FinancaState();
}

class _FinancaState extends State<Financa> {
  late Future<List<Item>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = FinancasNotion().getItem();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Finanças',
            style: AppTextStyle.titleF,
          ),
          centerTitle: true,     
        ),
        //RefreshIndicator para podermos atualizar a tela e os dados atualizarem tambem
        body: RefreshIndicator(
          onRefresh: () async {
            _futureItems = FinancasNotion().getItem();
            setState(() {});
          },
          child: FutureBuilder<List<Item>>(
            future: _futureItems,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return ListView.builder(
                    itemCount: items.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      //print para ver os itens que tenho disponivel
                      // print('${items['index -1']}');
                      //se o indice for zero retornarmos o indice de grafico
                      if (index == 0) return SpendingChart(items: items);

                      //como eu incremento +1 ali em cima, aqui eu preciso colocar -1
                      //precisso instanciar a classe Item para eu ver os itens diponiveis (exp: item.'name')
                      final Item item = items[index - 1];

                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 2,
                              color: getCategoryColor(item.categoria),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: ListTile(
                          //lembre-se as vezes ao colocar o . o parametro não é exibido, mas mesmo colocando parametro da certo
                          title: Text(
                            item.name,
                            //posso fazer operação ternaria
                            // item.name == 'Vitor' ? 'Condição verdadeira' : item.name,
                          ),
                          //para utilizarmos o subtitle que é a data e hora precisamos usar o (intl) que colocamos na dependencias
                          //para transforma-los em string
                          subtitle: Text(
                              '${item.categoria} - ${DateFormat.yMd().format(item.data)}'),
                          //aqui no trailing colocaremos o preço
                          //toStringAsFixed(2) para colocar apenas 2 casas decimais
                          trailing: Text('R\$${item.preco.toStringAsFixed(2)}'),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                //msg de erro
                final failure = snapshot.error as Failure;
                return Center(child: Text(failure.message));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
