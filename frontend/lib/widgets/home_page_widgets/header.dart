import 'package:flutter/material.dart';
import 'dart:html' as html;

class Header extends StatelessWidget {
  const Header({super.key});

  void downloadResume() {
  final url = "assets/resume/Resume - L. Manzanero.pdf";

  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "L. Manzanero.pdf")
    ..click();
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          width: 800, 
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(15, 93, 94, 94),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/profile.png',
                height: 140,
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Text('Lester Manzanero', style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight(600)
                    ),
                  ),     
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 18,),
                      Text('Laguna, Philippines', style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),)
                    ],
                  ),
                  SizedBox(height: 14,),
                  Text('Front-End Web Developer', style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Poppins",
                  ),),
                  SizedBox(height: 14,),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: downloadResume,
                        icon: const Icon(Icons.download_outlined),
                        label: const Text('Resume'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          foregroundColor: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.message_outlined),
                        label: const Text('Send Message'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.light_mode_outlined, color: Colors.grey,))
            ],
          ),
        ),
      ),
    );
  }
}