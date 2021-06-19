import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:notion/core/app_color.dart';
import 'package:notion/core/indicator.dart';
import 'package:notion/model/item_model.dart';

class SpendingChart extends StatelessWidget {
  //crie uma lista com o model
  final List<Item> items;

  //passe para o construtor o required e a lista
  const SpendingChart({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criando um map para interagir com o grafico
    final spending = <String, double>{};

    items.forEach((item) => spending.update(
        item.categoria, (value) => value + item.preco,
        ifAbsent: () => item.preco));

    return Card(
      margin: const EdgeInsets.all(8.0),  
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 360.0,
        child: Column(
          children: [
            Expanded(
              child: PieChart(PieChartData(
                sections: spending
                    .map((categoria, valorGasto) => MapEntry(
                          categoria,
                          PieChartSectionData(
                              color: getCategoryColor(categoria),
                              radius: 100.0,
                              title: 'R\$${valorGasto.toStringAsFixed(2)}',
                              value: valorGasto),
                        ))
                    .values
                    .toList(),
                sectionsSpace: 0,
              )),
            ),
            SizedBox(height: 20.0),
            //wrap criado junto com a classe Indicator para construir os quadrados informativos abaixo do grafico redondo
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: spending.keys.map((categoria) => Indicator(
                color: getCategoryColor(categoria),
                text: categoria
              )).toList()
            )
          ],
        ),
      ),
    );
  }
}



//ifAbsent =  Para evitar que um erro seja lançado caso a chave não exista, ele coloca o valor apenas (atualiza o map)
//ifAbsent =  Procura o valor da key ou adiciona um novo valor se ela nao existir
//como no planilha eu coloquei o 'aleatorio' ele não vai ter uma chave como 'Comida, Entreterimento, Combustivel etc..'
//ou seja ele coloca apenas o valor e coloca o titulo como eu defini no item_model =  categoria: properties['Categoria']?['select']?['name'] ?? 'Aleatório',