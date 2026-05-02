import 'package:flutter/material.dart';
import 'dart:html' as html;

class Header extends StatelessWidget {
  const Header({super.key});

  void downloadResume() {
    final url = Uri.base.resolve(
      "assets/resume/L.Manzanero.pdf",
    ).toString();

    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "L.Manzanero.pdf")
      ..click();
  }

  void openImage(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              // IMAGE (zoomable)
              Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    'assets/images/profile1.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // BACK BUTTON
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Container(
          width: 800,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(15, 93, 94, 94),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CLICKABLE IMAGE
              GestureDetector(
                onTap: () => openImage(context),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Image.asset(
                    'assets/images/profile1.jpg',
                    height: 140,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lester Manzanero',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 18),
                      SizedBox(width: 5),
                      Text(
                        'Laguna, Philippines',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Front-End Web Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Poppins",
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: downloadResume,
                        icon: const Icon(Icons.download_outlined),
                        label: const Text('Resume'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
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

              const Spacer(),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.light_mode_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}