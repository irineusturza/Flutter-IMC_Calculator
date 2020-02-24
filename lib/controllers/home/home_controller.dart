import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:imc_calc/models/home/home_model.dart';

class HomeController {
  HomeController();
  
  void getter(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }

 

  Future<String> calc({context, weightController, heightController}) async {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = double.parse((weight/(height*height)).toStringAsPrecision(3));
    FocusScope.of(context).requestFocus(FocusNode());
    
    if(imc < 18.6 ){
      return "$imc: Under weight";
    }else if(imc >= 18.6 && imc < 24.9){
      return "$imc: Ideal weight";
    }else if(imc >= 24.9 && imc < 29.9){
      return "$imc: Slightly overweight";
    }else if(imc >= 29.9 && imc < 34.9){
      return "$imc: Obesity grade 1";
    }else if(imc >= 34.9 && imc < 39.9){
      return "$imc: Obesity grade 2";
    }else if(imc >= 40.0){
      return "$imc: Obesity grade 3";
    }
  }

}