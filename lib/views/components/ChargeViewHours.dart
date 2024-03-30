import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

class ChargeViewHours extends StatelessWidget {
  final Reservation details;
  final Car selected;
  const ChargeViewHours({super.key, required this.details, required this.selected});

  @override
  Widget build(BuildContext context) {
    final hours = details.hours;
    final total = selected.rates['hourly']*hours;

    if (details.hours != 0) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Hourly ($hours hours)", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
            Align(alignment: Alignment.centerRight,child: Text("\$$total", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}