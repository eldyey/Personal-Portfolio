import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Color textColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.grey
      : Colors.black54;

  Color lineColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color.fromARGB(178, 158, 158, 158)
      : Colors.black26;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Center(
          child: Column(
            children: [
              Container(
                width: 800,
                height: 1,
                decoration: BoxDecoration(color: lineColor(context)),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright_outlined,
                    color: textColor(context),
                    size: 15,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '${DateTime.now().year} Lester Manzanero. All rights reserved.',
                    style: TextStyle(
                      color: textColor(context),
                      fontSize: 12,
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
