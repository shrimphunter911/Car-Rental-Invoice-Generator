import 'package:assignment/services/invoice_services.dart';
import 'package:flutter/material.dart';

class VehicleInformationView extends StatefulWidget {
  const VehicleInformationView({super.key});

  @override
  State<VehicleInformationView> createState() => _VehicleInformationViewState();
}

class _VehicleInformationViewState extends State<VehicleInformationView> {
  final service = InvoiceService();

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Vehicle Information", style: TextStyle(fontFamily: 'Roboto-Bold')),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: SingleChildScrollView(
              child: FutureBuilder(
                future: service.fetch(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    default:
                      if (snapshot.hasData){
                        print(snapshot.data);
                        return Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 2, color: const Color.fromRGBO(223, 223, 255, 1)),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Text('Vehicle Type*', style: TextStyle(fontSize: 18)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                    child: DropdownButtonFormField<int>(
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
                                      items: const [
                                        DropdownMenuItem(child: Text('Sedan'), value: 1),
                                        DropdownMenuItem(child: Text('SUV'), value: 2)
                                      ],
                                      onChanged: (int? value) {

                                      },
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Text('Vehicle Model*', style: TextStyle(fontSize: 18)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                    child: TextField(
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
                        );
                      }
                      else {
                        return CircularProgressIndicator();
                      }
                  }
                }
              )
          )
      ),
      persistentFooterButtons: [
        Center(
            child: Container(
              height: 55,
              width: 170,
              decoration: BoxDecoration(
                color: Color.fromRGBO(92, 93, 255, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                  onPressed: () async {
                    try {
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
