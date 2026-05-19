import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int? openIndex;

  final List<Map<String, dynamic>> data = const [
    {
      "title": "Frontend",
      "icon": Icons.code,
      "desc": "User interface and client-side development",
      "skills": [
        "Flutter / Dart",
        "ReactJS",
        "HTML",
        "CSS / Bootstrap",
        "JavaScript",
      ],
    },
    {
      "title": "Backend",
      "icon": Icons.api,
      "desc": "Server-side logic and APIs",
      "skills": ["Go (Gin)"],
    },
    {
      "title": "Database",
      "icon": Icons.storage_outlined,
      "desc": "Data storage and management systems",
      "skills": ["SQL", "PostgreSQL", "MySQL"],
    },
    {
      "title": "Tools",
      "icon": Icons.build,
      "desc": "Development and collaboration tools",
      "skills": ["Figma", "Git / GitHub", "Postman", "Jira", "JMeter"],
    },
  ];

  Color text(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark ? Colors.white : Colors.black;

  Color muted(BuildContext c) => Theme.of(c).brightness == Brightness.dark
      ? Colors.white70
      : Colors.black54;

  Color line(BuildContext c) => Theme.of(c).brightness == Brightness.dark
      ? Colors.white10
      : Colors.black12;

  Color iconBg(BuildContext c) => Theme.of(c).brightness == Brightness.dark
      ? Colors.white.withOpacity(0.10)
      : Colors.black.withOpacity(0.05);

  Color iconColor(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark ? Colors.white : Colors.black;

  Widget buildSkill(String s) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: isDark ? Colors.white10 : Colors.black12),
        color: isDark
            ? Colors.white.withOpacity(0.06)
            : Colors.black.withOpacity(0.04),
      ),
      child: Text(
        s,
        style: TextStyle(
          fontSize: 12,
          color: isDark ? Colors.white70 : Colors.black54,
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    final item = data[index];
    final isOpen = openIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: line(context)),
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBg(context),
                    border: Border.all(color: line(context)),
                  ),
                  child: Icon(
                    item["icon"],
                    size: 18,
                    color: iconColor(context),
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["title"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item["desc"],
                        style: TextStyle(fontSize: 12, color: muted(context)),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      openIndex = openIndex == index ? null : index;
                    });
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: AnimatedRotation(
                      turns: isOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: muted(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ClipRect(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: isOpen
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: (item["skills"] as List<String>)
                            .map((s) => buildSkill(s))
                            .toList(),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Skills & Tools",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: text(context),
                  ),
                ),

                Text(
                  "A breakdown of technologies I use to design, build, and ship software",
                  style: TextStyle(fontSize: 12.5, color: muted(context)),
                ),

                const SizedBox(height: 10),

                LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(data.length, (index) {
                        return SizedBox(
                          width: (constraints.maxWidth - 12) / 2,
                          child: buildCard(index),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
