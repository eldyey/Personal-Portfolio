import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final List<Map<String, String>> experiences = const [
    {
      "title": "BS Computer Engineering",
      "company": "Pamantasan ng Lungsod ng San Pablo",
      "date": "A.Y 2025-2026",
      "desc":
          "I graduated from Pamantasan ng Lungsod ng San Pablo (PLSP) with a Bachelor of Science in Computer Engineering. Throughout my academic journey, PLSP provided me with a strong foundation in both theoretical knowledge and practical skills in the field of computing and engineering.\n\nThe program equipped me with essential competencies in programming, computer systems, electronics, and software development, along with exposure to problem-solving and logical analysis. Through various coursework, laboratory activities, and project-based learning, I was able to develop critical thinking and technical skills necessary for the IT and engineering industry.\n\nBeyond academics, my experience at PLSP also helped me grow personally and professionally by enhancing my discipline, teamwork, and adaptability. The university played a significant role in preparing me for real-world challenges and my career in the field of technology.",
      "image": "assets/images/PLSP.png",
    },
    {
      "title": "Front-End Web Developer (Intern)",
      "company": "FDS Asya Philippines Inc.",
      "date": "Feb. - May 2026",
      "desc":
          "FDS ASYA PHILIPPINES INC. (FDSAP) is a leader in digital services, whose success is also attributed to the support of an international alliance with our holding, Fortress Digital Services (FDS Sarana Pactindo). With a deep understanding of local businesses, we have played a vital role since 2016 in facilitating the digitalization journeys of CARD Bank, CARD RBI, and CARD SME. Throughout the years, we have become one of Southeast Asia's leading IT companies and continues to be a trustworthy and reliable partner in the financial industry.\n\nI completed my on-the-job training at FDS Asia Philippines Inc. (FDSAP), a company specializing in digital solutions and supporting digital transformation for various partner institutions. During my training, I was exposed to five departments: Business Relationship Management, Project Management, Quality Assurance, Tech Support, and Solutions and Development.\n\nEach department provided valuable hands-on experience. In BRM, I created marketing materials using Canva and CapCut. In Project Management, I learned project coordination using Figma and Jira. In QA, I performed software testing using Postman and JMeter. In Tech Support, I was introduced to Docker and basic DevOps concepts. In Solutions and Development, I applied all my learnings by developing a system using Flutter, Go, and PostgreSQL.\n\nOverall, my OJT experience at FDSAP enhanced my technical skills and understanding of real-world software development and IT operations, preparing me for future industry work.",
      "image": "assets/images/FDSAP.png",
    },
    {
      "title": "Hello World!",
      "company": "PLSP University Laboratory",
      "date": "2023",
      "desc":
          "One of my most memorable experiences in my academic journey was in the computer laboratory at Pamantasan ng Lungsod ng San Pablo (PLSP), where I first wrote my “Hello World!” program. It was a simple exercise, but it marked the beginning of my interest in programming and software development.\n\nInside the laboratory, I was first introduced to basic programming concepts such as syntax, variables, and program structure. Although I was still a beginner at that time, successfully running my first program gave me a sense of accomplishment and motivation to continue learning more about coding.\n\nThat experience in the computer laboratory served as a foundation for my growth in Computer Engineering, gradually building my confidence and skills in programming and problem-solving.",
      "image": "assets/images/lab.jpg",
    },
  ];

  int? selectedIndex;
  int? hoveredIndex;

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

  Color line(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white24
      : Colors.black26;

  @override
  void initState() {
    super.initState();
    _loadSavedExperience();
  }

  Future<void> _loadSavedExperience() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt("selected_experience");

    if (index != null && index < experiences.length) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  Future<void> openExperience(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("selected_experience", index);

    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> closeExperience() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("selected_experience");

    setState(() {
      selectedIndex = null;
    });
  }

  Widget timelineItem(
    BuildContext context,
    Map<String, String> exp,
    bool isLast,
    int index,
  ) {
    final isHovered = hoveredIndex == index;
    final isActive = selectedIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (isHovered || isActive)
                      ? t(context)
                      : Colors.transparent,
                  border: Border.all(color: t(context), width: 1.5),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: line(context),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => openExperience(index),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        exp["title"]!,
                        style: TextStyle(
                          color: t(context),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailView(BuildContext context, Map<String, String> exp) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: closeExperience,
            icon: Icon(Icons.arrow_back, color: t(context)),
          ),
          const SizedBox(height: 5),
          if (exp["image"] != null && exp["image"]!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                exp["image"]!,
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.apartment, size: 40, color: t(context)),
            ),
          const SizedBox(height: 10),
          Text(
            exp["company"]!,
            style: TextStyle(
              color: t(context),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 10),
          Text(
            exp["desc"]!.isEmpty ? "No description available." : exp["desc"]!,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: muted(context),
              fontSize: 12,
              fontFamily: "Poppins",
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
        constraints: const BoxConstraints(maxWidth: 295),
        child: Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: selectedIndex != null
                ? detailView(context, experiences[selectedIndex!])
                : Column(
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
                        "What I’ve worked on:",
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
                                index,
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
