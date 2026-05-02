import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  Experience({super.key});

  final List<Map<String, String>> experiences = const [
    {
      "title": "BS Computer Engineering",
      "company": "Pamantasan ng Lungsod ng San Pablo",
      "date": "A.Y 2025-2026",
      "desc": ""
    },
    {
      "title": "Front-End Web Developer (Intern)",
      "company": "FDS Asya Philippines Inc.",
      "date": "Feb. - May 2026",
      "desc": ""
    },
    {
      "title": "Hello World!",
      "company": "University Laboratory",
      "date": "2023",
      "desc": "Wrote my first Hello World!"
    },
  ];

  Widget timelineItem(Map<String, String> exp, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 2),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  exp["company"]!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  exp["date"]!,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exp["desc"]!,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
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
          height: 462,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(15, 93, 94, 94),
          ),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Experience",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                Text('What I’ve worked on:', style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Poppins",
                  fontSize: 12,
                ),),

                const SizedBox(height: 15),

                Expanded(
                  child: Column(
                    children: List.generate(experiences.length, (index) {
                      return Expanded(
                        child: timelineItem(
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