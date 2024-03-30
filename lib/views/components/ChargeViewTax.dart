import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

class ChargeViewTax extends StatelessWidget {
  final Charges additional;
  const ChargeViewTax({super.key, required this.additional});

  @override
  Widget build(BuildContext context) {
    final tax = additional.tax;

    if (tax != 0) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Rental Tax", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
            Align(alignment: Alignment.centerRight,child: Text("$tax%", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}