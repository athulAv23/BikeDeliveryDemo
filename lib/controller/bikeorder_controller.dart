import 'package:bikeapp/model/bike_model.dart';
import 'package:bikeapp/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class BikeOrderController with ChangeNotifier {
  List<BikeModel> newmodel = [
    BikeModel("BAJAJ", "Ns 200", "1,59,000", "assets/bike1.png"),
    BikeModel("JAWA", "Jawa 350", "1,79,700", "assets/bike2.png"),
    BikeModel("YAMAHA", "Mt 250", "1,60,000", "assets/bike3.png"),
    BikeModel("HONDA", "X pulse 200", "1,23,999", "assets/bike4.png"),
    BikeModel("BAJAJ", "Dominar 400", "2,50,000", "assets/bike5.png")
  ];

  List<BikeModel> orders = [];

  orderbike(BikeModel model,context){
       orders.add(model);
       notifyListeners();
       CustomSnackBar().snackBar(context, 'Item added into your cart', const Color.fromARGB(255, 23, 148, 87)); 
   }

   removefromcart(int index,context){
    orders.removeAt(index);
    notifyListeners(); 
    CustomSnackBar().snackBar(context, 'removed from cart',const Color.fromARGB(255, 148, 23, 23));
 
   }

   
}
