import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  Color t(BuildContext context, {bool muted = false}) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return muted
        ? (dark ? Colors.white70 : Colors.black54)
        : (dark ? Colors.white : Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'About Me',
                style: TextStyle(
                  color: t(context),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: 20,
                ),
              ),

              Text(
                'Front-End Developer focused on building responsive and modern web applications\nusing Flutter and ReactJs and web technologies. Passionate about UI design,\nperformance, and user experience.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: t(context, muted: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
