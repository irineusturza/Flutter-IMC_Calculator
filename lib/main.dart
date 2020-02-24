import 'package:flutter/material.dart';
import 'package:imc_calc/views/home/home_view.dart';

void main() => runApp(MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Calculator"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: reset)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Weight",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                validator: (value){
                  if(value.isEmpty){
                    return "weight is required...";
                  }
                },
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Height",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                validator: (value){
                  if(value.isEmpty){
                    return "height is required...";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        calc();
                      }
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                infoController.text == null || infoController.text == ""
                    ? "waiting..."
                    : infoController.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      infoController.text = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  void calc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = double.parse((weight/(height*height)).toStringAsPrecision(3));
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      if(imc < 18.6 ){
        infoController.text = "$imc: Under weight";
      }else if(imc >= 18.6 && imc < 24.9){
        infoController.text = "$imc: Ideal weight";
      }else if(imc >= 24.9 && imc < 29.9){
        infoController.text = "$imc: Slightly overweight";
      }else if(imc >= 29.9 && imc < 34.9){
        infoController.text = "$imc: Obesity grade 1";
      }else if(imc >= 34.9 && imc < 39.9){
        infoController.text = "$imc: Obesity grade 2";
      }else if(imc >= 40.0){
        infoController.text = "$imc: Obesity grade 3";
      }
    });

  }
}
