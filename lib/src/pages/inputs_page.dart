import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionesSeleccionada = '';
  TextEditingController _inputFieldDateController = new TextEditingController();

  List<String> _poderes = ['Volar', 'Rayos x', 'Super Fuerza'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
           _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
//    autofocus: true,
    textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
      setState(() {
        _nombre = valor;
      });

      },
    );
  }



  Widget _crearPersona() {


    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionesSeleccionada),
    );


  }

  Widget _crearEmail() {


    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),

          hintText: 'Email',
          labelText: 'Email',

          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.email)
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });

      },
    );

  }

  Widget _crearPassword() {


    return TextField(
      obscureText: true,
//      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),

          hintText: 'Password',
          labelText: 'Password',

          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock_open)
      ),
      onChanged: (valor) {
        setState(() {

        });

      },
    );

  }

  Widget _crearFecha(BuildContext context) {


    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),

          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento ',

          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },

    );

  }


  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es')
    );

    if(picked != null){

      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
  List<DropdownMenuItem<String>> getOpcionesDropDown() {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(
        children: <Widget>[
          Icon(Icons.select_all),
          SizedBox(
            width: 30.0,
          ),
          DropdownButton(
          value: _opcionesSeleccionada.isNotEmpty ? _opcionesSeleccionada : null,
          items: getOpcionesDropDown(),
          onChanged: (opt) {
            setState(() {
              _opcionesSeleccionada = opt;
            });
          },
        ),
        ],
      );

  }

}

