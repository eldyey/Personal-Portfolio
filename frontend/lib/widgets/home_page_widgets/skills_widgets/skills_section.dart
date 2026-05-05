import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  Color text(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white
      : Colors.black;

  Color muted(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white70
      : Colors.black54;

  Color border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white24
      : Colors.black26;

  Color bg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color.fromARGB(15, 93, 94, 94)
      : Colors.white;

  Widget skillItem(BuildContext context, String textValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        textValue,
        style: TextStyle(
          color: muted(context),
          fontSize: 12,
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Widget skillColumn(BuildContext context, String title, List<String> skills) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: border(context)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: text(context),
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            ...skills.map((e) => skillItem(context, e)),
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
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Skills & Tools",
                style: TextStyle(
                  color: text(context),
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'What I work with:',
                style: TextStyle(
                  color: muted(context),
                  fontFamily: "Poppins",
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  skillColumn(context, "Frontend", [
                    "Flutter / Dart",
                    "ReactJS",
                    "HTML",
                    "CSS/Bootsrap",
                    "JavaScript",
                  ]),

                  const SizedBox(width: 10),

                  skillColumn(context, "Backend", [
                    "Go Lang/Gin",
                    "",
                    "",
                    "",
                    "",
                  ]),

                  const SizedBox(width: 10),

                  skillColumn(context, "Db Management", [
                    "SQL",
                    "PostgreSQL",
                    "MySQL",
                    "",
                    "",
                  ]),

                  const SizedBox(width: 10),

                  skillColumn(context, "Other", [
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
