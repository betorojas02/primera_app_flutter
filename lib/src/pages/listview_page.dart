import 'dart:async';

import 'package:flutter/material.dart';


class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> Enteros = new List();
  int _utimoItem = 0;
  bool _isLoading  = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fechaData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      )


    );
  }


  Widget _crearLista() {

    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: Enteros.length,
        itemBuilder: (BuildContext context , int index) {
          final image = Enteros[index];
              return FadeInImage(
                image: NetworkImage('https://picsum.photos/500/300?random=$image'),
                placeholder: AssetImage('assets/original.gif'),
              );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);

     new Timer ( duration, () {
        Enteros.clear();
        _utimoItem++;
        _agregar10();

    });
     
     return Future.delayed(duration);
  }



  void _agregar10() {
    setState(() {
      for(var i = 0 ; i < 10 ; i++){
        _utimoItem++;
        Enteros.add(_utimoItem);
      }
    });

  }

  Future fechaData() async {

    _isLoading = true;
    setState(() {

    });

    final duration = new Duration( seconds: 2);
    return new Timer(duration , respuestaHTTP );
  }

  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels +100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregar10();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

 Widget _crearLoading() {
    if( _isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],

      );
    }else{
      return Container();
    }
 }
}
