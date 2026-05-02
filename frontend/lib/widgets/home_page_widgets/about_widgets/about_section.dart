import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget{
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        width: 800,
        decoration: BoxDecoration(
        color: const Color.fromARGB(15, 93, 94, 94),
        ),
        child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('About Me', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight(600),
                fontFamily: "Poppings",
                fontSize: 20,
              ),),
              SizedBox(height: 10,),
              Text('Front-End Developer focused on building responsive and modern web applications\nusing Flutter and ReactJs and web technologies. Passionate about UI design,\nperformance, and user experience.', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.grey
              ),)
            ],
          ),
        ),
      ),
    );
  }
}