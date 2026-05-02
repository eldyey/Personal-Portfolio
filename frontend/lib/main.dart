import 'package:flutter/material.dart';
import 'package:frontend/page/home_page.dart';

void main(){
  runApp(Portfolio());
}

class Portfolio extends StatelessWidget{
  const Portfolio({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Lester M. | Front-End Developer',
      home: HomePage(),
    );
  }
}