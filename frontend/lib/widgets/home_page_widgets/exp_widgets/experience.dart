import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  Experience({super.key});

  final List<Map<String, String>> experiences = const [
    {
      "title": "BS Computer Engineering",
      "company": "Pamantasan ng Lungsod ng San Pablo",
      "date": "A.Y 2025-2026",
      "desc": "",
    },
    {
      "title": "Front-End Web Developer (Intern)",
      "company": "FDS Asya Philippines Inc.",
      "date": "Feb. - May 2026",
      "desc": "",
    },
    {
      "title": "Hello World!",
      "company": "University Laboratory",
      "date": "2023",
      "desc": "Wrote my first Hello World!",
    },
  ];

  Color t(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white
      : Colors.black;

  Color muted(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white70
      : Colors.black54;

  Color faint(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white38
      : Colors.black38;

  Widget timelineItem(
    BuildContext context,
    Map<String, String> exp,
    bool isLast,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 2),

            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: t(context),
                shape: BoxShape.circle,
              ),
            ),

            if (!isLast)
              Expanded(
                child: Container(
                  width: 2,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  color: Colors.white24,
                ),
              ),
          ],
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  exp["title"]!,
                  style: TextStyle(
                    color: t(context),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  exp["company"]!,
                  style: TextStyle(color: muted(context), fontSize: 11),
                ),

                const SizedBox(height: 2),

                Text(
                  exp["date"]!,
                  style: TextStyle(color: faint(context), fontSize: 10),
                ),

                const SizedBox(height: 4),

                Text(
                  exp["desc"]!,
                  style: TextStyle(color: muted(context), fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 295),
        child: Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(color: Theme.of(context).cardColor),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Experience",
                  style: TextStyle(
                    color: t(context),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),

                Text(
                  'What I’ve worked on:',
                  style: TextStyle(
                    color: muted(context),
                    fontFamily: "Poppins",
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 15),

                Expanded(
                  child: Column(
                    children: List.generate(experiences.length, (index) {
                      return Expanded(
                        child: timelineItem(
                          context,
                          experiences[index],
                          index == experiences.length - 1,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
