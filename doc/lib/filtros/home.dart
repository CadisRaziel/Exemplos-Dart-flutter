import 'package:doc/filtros/filter_select.dart';
import 'package:flutter/material.dart';

@immutable
class ExampleInstagramFilterSelection extends StatefulWidget {
  const ExampleInstagramFilterSelection({Key? key}) : super(key: key);

  @override
  _ExampleInstagramFilterSelectionState createState() =>
      _ExampleInstagramFilterSelectionState();
}

class _ExampleInstagramFilterSelectionState
    extends State<ExampleInstagramFilterSelection> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  ///Quando o valor é substituído por algo que não é igual ao valor antigo, 
  ///conforme avaliado pelo operador de igualdade ==, essa classe notifica seus ouvintes
  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      ///Stack = Serve para colocar um widget em cima do outro !
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    ///ValueListenableBuilder = quando trocamos os filtros ele vai atualizando a tela conforme a cor do filtro
    ///ele escura a chamada dde um valueNotifier
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, value, child) {
        final color = value as Color;
        return Image.network(
          'https://scontent.faqa1-1.fna.fbcdn.net/v/t1.6435-9/88964975_220961002435134_737567462362447872_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=174925&_nc_eui2=AeFvcG4qvZTNtJ6dxeIhmqqg_dZows4t7r791mjCzi3uvpmQe4kY6hcgBNbianw7HdABrJ4HAs0TXwQdmm-WKosr&_nc_ohc=AezJ9Aprhq0AX--Vkmi&_nc_ht=scontent.faqa1-1.fna&oh=f66a148fcbc2405867c634d2019b4e26&oe=60D2B349',
          
          ///Este color é os efeitos !!
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}