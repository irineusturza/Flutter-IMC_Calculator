import 'package:flutter/material.dart';
import 'package:imc_calc/views/home/components/fieldWidget.dart';
import 'package:provider/provider.dart';
// import model
import 'package:imc_calc/models/home/home_model.dart';
// import controller
import 'package:imc_calc/controllers/home/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              FieldWidget(controller: weightController, text: "Weight"),
              FieldWidget(controller: heightController, text: "Height"),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await HomeController().calc(
                          heightController: heightController,
                          weightController: weightController,
                          context: context).then((msg) {
                            setState(() {
                              infoController.text = msg;
                            });
                        });
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
    weightController.text = "";
    heightController.text = "";
    infoController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();      
    });
  }
}


