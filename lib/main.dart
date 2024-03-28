import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        ),
        home: const RentalHome()),
  );
}

class RentalHome extends StatefulWidget {
  const RentalHome({super.key});

  @override
  State<RentalHome> createState() => _RentalHomeState();
}

class _RentalHomeState extends State<RentalHome> {
  final post = InvoiceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
      ),
      body: FutureBuilder(
        future: post.fetch(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            default: if (snapshot.hasData) {
              final data = snapshot.data;
              print(data);
              return Placeholder();
            }
            else {
              return CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }
}

