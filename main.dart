import 'package:assignmet_4/product.dart';
import 'package:assignmet_4/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.black87,
          leading: const BackButton(),


          title: const Text("Ibrahim's Store" , style: TextStyle(   fontStyle: FontStyle.italic, color: Colors.blueAccent),),
          centerTitle: true,

          actions: const [
            Icon(IconData(0xe3dc,
                fontFamily: 'MaterialIcons',
                matchTextDirection: true)),
          ],
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    ProductCard(product: sampleProduct1,),
                    ProductCard(product: sampleProduct2,),
                    ProductCard(product: sampleProduct3,),
                    ProductCard(product: sampleProduct4,),
                    ProductCard(product: sampleProduct5,),
                    ProductCard(product: sampleProduct6,),
                    ProductCard(product: sampleProduct7,),
                    ProductCard(product: sampleProduct8,),
                    ProductCard(product: sampleProduct9,),



                  ],
                ),
              ),
            )),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
          backgroundColor: Colors.white,
          child: Icon(Icons.shopping_cart, color: Colors.deepOrange,),
        ),
      ),
    );
  }
}





















