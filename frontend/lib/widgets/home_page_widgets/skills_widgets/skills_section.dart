import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  Widget skillItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Widget skillColumn(String title, List<String> skills) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            ...skills.map(skillItem),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color.fromARGB(15, 93, 94, 94),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Skills & Tools",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('What I work with:', style: TextStyle(
                color: Colors.grey,
                fontFamily: "Poppins",
                fontSize: 12
              ),),

              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  skillColumn("Frontend", [
                    "Flutter / Dart",
                    "ReactJS",
                    "HTML",
                    "CSS/Bootsrap",
                    "JavaScript",
                  ]),

                  const SizedBox(width: 10),

                  skillColumn("Backend", [
                    "Go Lang/Gin",
                    "",
                    "",
                    "",
                    "",

                  ]),

                  const SizedBox(width: 10),

                  skillColumn("Db Management", [
                    "SQL",
                    "PostgreSQL",
                    "MySQL",
                    "",
                    "",
                    

                  ]),

                  const SizedBox(width: 10),

                  skillColumn("Other", [
                    "Figma",
                    "Git / GitHub",
                    "JMeter",
                    "Postman",
                    "Jira",

                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}