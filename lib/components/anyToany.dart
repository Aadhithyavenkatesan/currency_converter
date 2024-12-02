import 'package:currency_converter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class anyToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const anyToAny({Key? key, required this.rates, required this.currencies})
      : super(key: key);

  @override
  State<anyToAny> createState() => _anyToAnyState();
}

class _anyToAnyState extends State<anyToAny> {
  TextEditingController amountController = TextEditingController();
  String dropdownValue1 = 'INR';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'USD to Any Currency',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                key: Key('usd'),
                controller: amountController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Enter Amount',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: DropdownButton(
                          items: widget.currencies.keys
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          dropdownColor: Colors.grey.shade900,
                          value: dropdownValue1,
                          style: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          })),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'To',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                      child: DropdownButton(
                          items: widget.currencies.keys
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          dropdownColor: Colors.grey.shade900,
                          value: dropdownValue2,
                          style: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          })),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          answer = amountController.text +
                              '${dropdownValue1}      =      ' +
                              convertany(widget.rates, amountController.text,
                                  dropdownValue1, dropdownValue2) +
                              ' ' +
                              dropdownValue2;
                        });
                      },
                      child: Text('Convert'),
                      style: ButtonStyle(
                          backgroundColor: WidgetStateColor.resolveWith(
                              (states) => Colors.blue.shade400)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  answer,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
