import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
        centerTitle: true,
      ),
    body: Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          _crearSlider(),
          _crearChexbox(),
          _crearSwitch(),
          Expanded(child: _crearImagen()),
        ],
      ),
    ),
    );
  }


  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño imagen',
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: _bloquearCheck ? null : (valor) {
          setState(() {
            _valorSlider =  valor;
          });

        }  ,
    );
  }
  Widget _crearChexbox() {
/*    return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });

      },
    );*/


  return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged:  (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
  );
  }


  Widget _crearSwitch() {


    return SwitchListTile(
      title: Text('Bloquear switch slider'),
        value: _bloquearCheck,
         onChanged:  (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Escudo_de_Millonarios_temporada_2017.png/1200px-Escudo_de_Millonarios_temporada_2017.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
