import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

class ChargeViewDays extends StatelessWidget {
  final Reservation details;
  final Car selected;
  const ChargeViewDays({super.key, required this.details, required this.selected});

  @override
  Widget build(BuildContext context) {
    final days = details.days;
    final total = selected.rates['daily']*days;

    if (details.days != 0) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Daily ($days days)", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
            Align(alignment: Alignment.centerRight,child: Text("\$$total", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
