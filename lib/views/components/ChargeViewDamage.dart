import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

class ChargeViewDamage extends StatelessWidget {
  final Charges additional;
  const ChargeViewDamage({super.key, required this.additional});

  @override
  Widget build(BuildContext context) {
    final damage = additional.damage;

    if (damage != 0) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Collision Damage Waiver", style: TextStyle(fontFamily: 'Roboto', fontSize: 20))),
            Align(alignment: Alignment.centerRight,child: Text("\$$damage", style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}