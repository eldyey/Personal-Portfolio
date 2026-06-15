import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;

class Header extends StatelessWidget {
  final VoidCallback onMessageClick;
  final Function(bool) onToggleTheme;
  final bool isDark;

  const Header({
    super.key,
    required this.onMessageClick,
    required this.onToggleTheme,
    required this.isDark,
  });

  Future<void> downloadResume() async {
  final url = 'assets/resume/Lester_John_Manzanero.pdf';
  html.window.open(url, '_blank');
}

  void openImage(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    isDark
                        ? 'assets/images/profile1-night.png'
                        : 'assets/images/profile1.jpg',
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget themeSwitch() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onToggleTheme(!isDark),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 55,
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDark ? Colors.white24 : Colors.black12,
            border: Border.all(color: isDark ? Colors.white : Colors.black),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? Colors.black : Colors.white,
              ),
              child: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                size: 14,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : Colors.black;
    final borderColor = isDark ? Colors.white : Colors.black;

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    Widget profileImage() {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            key: ValueKey(isDark),
            onTap: () => openImage(context),
            child: Image.asset(
              isDark
                  ? 'assets/images/profile1-night.png'
                  : 'assets/images/profile1.jpg',
              height: isMobile ? 110 : 140,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          width: isMobile ? double.infinity : 800,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileImage(),
                    const SizedBox(height: 15),
                    buildInfo(textColor, borderColor, context),
                    const SizedBox(height: 15),
                    themeSwitch(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileImage(),
                    const SizedBox(width: 15),
                    buildInfo(textColor, borderColor, context),
                    const Spacer(),
                    themeSwitch(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildInfo(Color textColor, Color borderColor, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Lester Manzanero',
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(Icons.verified, color: Colors.blue, size: 20),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red, size: 18),
            const SizedBox(width: 5),
            Text(
              'Laguna, Philippines',
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          'Aspiring Front-End Web Developer',
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: downloadResume,
              icon: const Icon(Icons.view_day_outlined, color: Colors.white),
              label: const Text(
                'Resume',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: onMessageClick,
              icon: Icon(Icons.message_outlined, color: textColor),
              label: Text('Send Message', style: TextStyle(color: textColor)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                side: BorderSide(color: borderColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
