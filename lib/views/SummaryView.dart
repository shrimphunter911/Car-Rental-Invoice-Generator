import 'package:assignment/services/invoice_services.dart';
import 'package:assignment/views/components/ChargeViewDamage.dart';
import 'package:assignment/views/components/ChargeViewDays.dart';
import 'package:assignment/views/components/ChargeViewHours.dart';
import 'package:assignment/views/components/ChargeViewInsurance.dart';
import 'package:assignment/views/components/ChargeViewTax.dart';
import 'package:assignment/views/components/ChargeViewWeeks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Page to show overall summary and generate an invoice for the user

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
    final service = InvoiceService();
    final details = widget.details;
    final information = widget.information;
    final selected = widget.selected;
    final additional = widget.additional;
    final total = service.total(details, selected, additional);
    var pickupTime = DateFormat('jm').format(details.pickupDateTime);
    var pickupDate = DateFormat('yMMMMd').format(details.pickupDateTime);
    var dropoffTime = DateFormat('jm').format(details.dropOffTime);
    var dropoffDate = DateFormat('yMMMMd').format(details.dropOffTime);
    var carMake = selected.make;
    var carModel = selected.model;

    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
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
                          const Align(alignment: Alignment.centerLeft, child: Text("Reservation ID", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text(details.id, style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Pickup Date", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text('$pickupTime, $pickupDate', style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Dropoff Date", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text('$dropoffTime, $dropoffDate', style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
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
                          const Align(alignment: Alignment.centerLeft, child: Text("First Name", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text(information.firstName, style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Last Name", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text(information.lastName, style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Email", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text(information.email, style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Phone", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text(information.phone, style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
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
                          const Align(alignment: Alignment.centerLeft, child: Text("Vehicle Type", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text(selected.type, style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Vehicle Model", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text('$carMake $carModel', style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(alignment: Alignment.centerLeft,child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Charges Summary", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 24)),
            )),
            Container(
              height: 2.0,
              color: const Color.fromRGBO(93, 92, 255, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 223, 255, 1),
                  border: Border.all(width: 2, color: const Color.fromRGBO(93, 92, 255, 1)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(alignment: Alignment.center,child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Charge", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 20)),
                        )),
                        Align(alignment: Alignment.center,child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Total", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 20)),
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 2.0,
                        color: const Color.fromRGBO(93, 92, 255, 1),
                      ),
                    ),
                    ChargeViewWeeks(details: details, selected: selected),
                    ChargeViewDays(details: details, selected: selected),
                    ChargeViewHours(details: details, selected: selected),
                    ChargeViewDamage(additional: additional),
                    ChargeViewInsurance(additional: additional),
                    ChargeViewTax(additional: additional),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text("Net Total", style: TextStyle(fontFamily: 'Roboto-Bold', fontSize: 20))),
                          Align(alignment: Alignment.centerRight,child: Text('\$$total', style: const TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
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
    );
  }
}
