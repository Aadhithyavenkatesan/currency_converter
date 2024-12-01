import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget {
  

  final rates;
  final Map currencies;
  const UsdToAny({Key? key, required this.rates, required this.currencies}) : super(key: key);

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text('USD to Any Currency', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),),
            )
          ],
        )
      ),
    );
  }
}