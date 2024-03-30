import 'package:assignment/services/invoice_services.dart';
import 'package:assignment/views/VehicleInformationView.dart';
import 'package:flutter/material.dart';

class CustomerInformationView extends StatefulWidget {
  final Reservation details;
  const CustomerInformationView({super.key, required this.details});

  @override
  State<CustomerInformationView> createState() => _CustomerInformationViewState();
}

class _CustomerInformationViewState extends State<CustomerInformationView> {
  // Text Editing Controllers to control TextFields
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final details = widget.details;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 2.0,
              color: const Color.fromRGBO(93, 92, 255, 1),
            )
        ),
        title: const Text("Customer Information", style: TextStyle(fontFamily: 'Roboto-Bold')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color.fromRGBO(223, 223, 255, 1)),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('First Name*', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextField(
                    controller: firstName,
                    decoration: InputDecoration(
                      hintText: '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(223, 223, 255, 1)
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color.fromRGBO(223, 223, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Last Name*', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextField(
                    controller: lastName,
                    decoration: InputDecoration(
                      hintText: '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(223, 223, 255, 1)
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color.fromRGBO(223, 223, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Email*', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(223, 223, 255, 1)
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color.fromRGBO(223, 223, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Phone*', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(223, 223, 255, 1)
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.5,
                          color: Color.fromRGBO(223, 223, 255, 1),
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ]
            )
          )
        )
      ),
      persistentFooterButtons: [
        Center(
            child: Container(
              height: 55,
              width: 170,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(92, 93, 255, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                  onPressed: () {
                    try {
                      // Constructing customer information
                      final customer = Customer(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        email: email.text,
                        phone: phone.text,
                      );
                      // Navigating to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VehicleInformationView(details: details, information: customer,)
                        ),
                      );
                    } catch (e) {
                      throw Exception('Could not make reservation');
                    }
                  },
                  child: const Text('Next', style: TextStyle(color: Colors.white),)
              ),
            )
        )
      ],
    );
  }
}
