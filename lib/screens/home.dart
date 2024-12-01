import 'package:currency_converter/functions/fetchrates.dart';
import 'package:currency_converter/models/ratesmodelfromjson.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final formkey = GlobalKey<FormState>; 
  late Future<RatesModel> result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = fetchrates();
  }

  @override
  Widget build(BuildContext context) {
    
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('Currency Converter'),
        centerTitle: true,
      ),

      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.only(top: 65, left: 15, right: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
             image: AssetImage("assests/assets/bg-currency_ex.png"),
             fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<RatesModel>(
              future: result, 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: FutureBuilder<>(future: future, builder: builder),
                );
              }
          ),
        ),
      ),
    )
    );
  }
}