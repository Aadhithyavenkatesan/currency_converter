import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget {
  

  final rates;
  final Map currencies;
  const UsdToAny({Key? key, required this.rates, required this.currencies}) : super(key: key);

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'INR';
  String result = 'Converted Currency';

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
              child: Text('USD to Any Currency', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 20,

            ),
            TextFormField(
              key: Key('usd'),
              controller: usdController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter USD',
                hintStyle: TextStyle(
                  color: Colors.white,
                )
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton(
                    items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    dropdownColor: Colors.grey.shade900,
                    value: dropdownValue,
                    style: TextStyle(color: Colors.white),
                    icon: Icon(Icons.arrow_downward,
                    color: Colors.white,),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                  onChanged: (String? newValue){
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  }))
              ],
            )
          ],
        )
      ),
    );
  }
}