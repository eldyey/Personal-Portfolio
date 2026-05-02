import 'package:flutter/material.dart';

class Footer extends StatelessWidget{
  const Footer({super.key});
  @override

  Widget build (BuildContext context){
    return 
      Column(
          children: [
            SizedBox(height: 30,),
        Center(
        child: Column(
          children: [
            Container(
              width: 800,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.copyright_outlined, color: Colors.grey, size: 15,),
                  SizedBox(width: 2,),
              Text('${DateTime.now().year} Lester Manzanero. All rights reserved.', style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: "Poppins"
                    ),
                  )
                ]
              ),
            ]
          )
        ),
        SizedBox(height: 30,)
      ]
    );
  }
}