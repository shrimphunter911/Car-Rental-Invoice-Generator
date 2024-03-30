import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryView extends StatefulWidget {
  final Reservation details;
  final Customer information;
  final Car selected;
  final Charges additional;
  const SummaryView({super.key, required this.details, required this.information, required this.selected, required this.additional});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  @override
  Widget build(BuildContext context) {
    final details = widget.details;
    final information = widget.information;
    final selected = widget.selected;
    final additional = widget.additional;
    var pickupTime = DateFormat('jm').format(details.pickupDateTime);
    var pickupDate = DateFormat('yMMMMd').format(details.pickupDateTime);
    var dropoffTime = DateFormat('jm').format(details.dropOffTime);
    var dropoffDate = DateFormat('yMMMMd').format(details.dropOffTime);
    var carMake = selected.make;
    var carModel = selected.model;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(alignment: Alignment.centerLeft,child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Reservation Details", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24)),
              )),
              Container(
                height: 2.0,
                color: const Color.fromRGBO(93, 92, 255, 1),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: const Color.fromRGBO(223, 223, 255, 1)),
                      borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Reservation ID", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text(details.id, style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Pickup Date", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text('$pickupTime, $pickupDate', style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Dropoff Date", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text('$dropoffTime, $dropoffDate', style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(alignment: Alignment.centerLeft,child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Customer Information", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24)),
              )),
              Container(
                height: 2.0,
                color: const Color.fromRGBO(93, 92, 255, 1),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: const Color.fromRGBO(223, 223, 255, 1)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("First Name", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text(information.firstName, style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Last Name", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text(information.lastName, style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Email", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text(information.email, style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Phone", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text(information.phone, style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(alignment: Alignment.centerLeft,child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Vehicle Information", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24)),
              )),
              Container(
                height: 2.0,
                color: const Color.fromRGBO(93, 92, 255, 1),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: const Color.fromRGBO(223, 223, 255, 1)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Vehicle Type", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text(selected.type, style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Vehicle Model", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text('$carMake $carModel', style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(alignment: Alignment.centerLeft,child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Reservation Details", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24)),
              )),
              Container(
                height: 2.0,
                color: const Color.fromRGBO(93, 92, 255, 1),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: const Color.fromRGBO(223, 223, 255, 1)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Reservation ID", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text("Reservation Details", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Reservation ID", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text("Reservation Details", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(child: Text("Reservation ID", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerLeft),
                            Align(child: Text("Reservation Details", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)), alignment: Alignment.centerRight,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
