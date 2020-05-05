import 'package:apk01/src/pages/alert_page.dart';
import 'package:apk01/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_helper/icons_helper.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('HOME PAGE'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }
}

Widget _lista(){


  return FutureBuilder(
    future: menuProvider.cargarData(),
    initialData: [],
    builder: ( context, AsyncSnapshot<List<dynamic>> snashot) {
      return ListView(
        children: _listaItems( snashot.data , context),
      );
    },
  );


}

List<Widget> _listaItems(List<dynamic> data , BuildContext context) {


  final List<Widget> opciones = [];




  data.forEach( (opt) {

    final wigetTemp = ListTile(
        title: Text(opt['texto']),
        leading: Icon(getIconUsingPrefix(name: opt['icon']) , color:  Colors.blue),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.amber) ,
        onTap: () {

          Navigator.pushNamed(context, opt['ruta']);

      /*    final route = MaterialPageRoute(
            builder: (context) => AlertPage()

          );
          Navigator.push(context, route);
*/
        },
    );
    opciones..add(wigetTemp)
            ..add(Divider());
  });


  return opciones;



}



