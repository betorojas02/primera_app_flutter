import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
        centerTitle: true,
      ),

      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album , color: Colors.blue),
          title: Text('Soy el titulo'),
          subtitle: Text('a quei estamos con la tarejta de etsta tarjeta que es la machera hpta que rico'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {

              },
            ),
            FlatButton(
              child: Text('Ok '),
              onPressed: () {

              },
            )
          ],
        )
      ],
    ),
    );
  }

  Widget _cardTipo2() {

    final card =  Container(
//      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Escudo_de_Millonarios_temporada_2017.png/1200px-Escudo_de_Millonarios_temporada_2017.png'),
            placeholder: AssetImage('assets/original.gif'),
            height: 250.0,
            fit: BoxFit.cover,
          ),
//          Image(
//            image: NetworkImage('https://www.publicdomainpictures.net/pictures/30000/velka/evening-landscape-13530956185Aw.jpg')
//          ),
          Text('No tengo idea de que poner')
        ],
      ),
    );
    return Container(
      child: ClipRRect(
        child: card,

        borderRadius: BorderRadius.circular(30.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ],

//        color: Colors.red
      ),

    );
  }




  
}
