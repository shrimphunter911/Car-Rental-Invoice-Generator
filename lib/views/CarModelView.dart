import 'package:flutter/material.dart';
import '../services/invoice_services.dart';

// Widget to show selected car image and details

class CarModelView extends StatefulWidget {
  Car? selectedCar;
  CarModelView({super.key, required this.selectedCar});

  @override
  State<CarModelView> createState() => _CarModelViewState();
}

class _CarModelViewState extends State<CarModelView> {

  @override
  Widget build(BuildContext context) {
    var car = widget.selectedCar;
    var carMake = car?.make;
    var carModel = car?.model;
    var carSeats = car?.seats;
    var carBags = car?.bags;
    var rateHour = car?.rates['hourly'];
    var rateDay = car?.rates['daily'];
    var rateWeek = car?.rates['weekly'];

    if (widget.selectedCar == null){
      return const Text('No vehicle selected');
    } else {
      return Column(
        children: [
          Row(
            children: [
              SizedBox(child: Image.network(widget.selectedCar!.imageURL), height: 200, width: 175),
              Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Text('$carMake $carModel', style: const TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24),),
                    SizedBox(height: 35,child: ListTile(leading: const Icon(Icons.people), title: Text('$carSeats seat')),),
                    SizedBox(height: 35,child: ListTile(leading: const Icon(Icons.shopping_bag), title: Text('$carBags bags')),)
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$$rateHour / Hour'),
              Text('\$$rateDay / Day'),
              Text('\$$rateWeek / Week')
            ],
          )
        ],
      );
    }
  }
}
