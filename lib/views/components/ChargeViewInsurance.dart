import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

class ChargeViewInsurance extends StatelessWidget {
  final Charges additional;
  const ChargeViewInsurance({super.key, required this.additional});

  @override
  Widget build(BuildContext context) {
    final insurance = additional.insurance;

    if (insurance != 0) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Liability Insurance", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
            Align(alignment: Alignment.centerRight,child: Text("\$$insurance", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}