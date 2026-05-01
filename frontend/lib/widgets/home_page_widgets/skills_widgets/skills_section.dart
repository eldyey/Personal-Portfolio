import 'package:flutter/material.dart';
import 'dart:async';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;

  final List<Map<String, dynamic>> skills = [
    {
      "title": "Flutter",
      "image": "assets/images/flutter.png",
      "color": Colors.blue
    },
    {
      "title": "HTML",
      "image": "assets/images/html.png",
      "color": Colors.orange
    },
    {
      "title": "CSS",
      "image": "assets/images/css.png",
      "color": Colors.blueAccent
    },
    {
      "title": "JavaScript",
      "image": "assets/images/js.png",
      "color": Colors.yellow
    },
    {
      "title": "Git",
      "image": "assets/images/git.png",
      "color": Colors.red
    },
    {
      "title": "UI/UX",
      "image": "assets/images/figma.png",
      "color": Colors.purple
    },
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_controller.hasClients) {
        double maxScroll = _controller.position.maxScrollExtent;
        double current = _controller.offset;

        if (current >= maxScroll) {
          _controller.jumpTo(0);
        } else {
          _controller.animateTo(
            current + 1,
            duration: const Duration(milliseconds: 30),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Widget skillCard(String title, String image, Color color) {
    return Container(
      width: 190,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          Image.asset(
            image,
            height: 60,
            width: 60,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(15, 93, 94, 94),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Skills",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 70,
              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: 1000,
                itemBuilder: (context, index) {
                  final skill = skills[index % skills.length];
                  return skillCard(
                    skill["title"],
                    skill["image"],
                    skill["color"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}