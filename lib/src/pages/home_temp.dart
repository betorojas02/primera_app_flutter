

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{

  final opciones = ['Uno' , 'Dos' , 'Tres' , 'Cuatro' , 'Cienco'  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes '),
      ),
      body: ListView(
        children:_crearItemsCorta(),
      ),
    );
  }




List<Widget> _crearItem() {

    List<Widget> lista = new List<Widget>();

    for( String opt in opciones){

      final tempWight = ListTile(
        title: Text (opt),
      );
      lista..add(tempWight)
           ..add(Divider());
    }
    return lista;
}

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {

            },
          ),
          Divider()
        ],
      );
    }).toList();
  }


}