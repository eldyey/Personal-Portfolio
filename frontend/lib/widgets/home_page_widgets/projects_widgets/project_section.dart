import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/home_page_widgets/exp_widgets/experience.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  late PageController _controller;
  Timer? _timer;
  bool isPlaying = true;

  int currentIndex = 0;

  final List<Map<String, String>> projects = [
    {
      "title": "Project 1",
      "desc": "Internship Management System",
      "sub": "Flutter/Dart • Go Lang • Postgres",
      "extra": "Internship project for internship tracking system",
      "image": "assets/images/project1.jpg",
    },
    {
      "title": "Project 2",
      "desc": "Computer History",
      "sub": "HTML • CSS/Bootstrap • JavaScript",
      "extra": "https://eldyey.github.io/CPE413/",
      "image": "assets/images/project2.jpg",
    },
    {
      "title": "Project 3",
      "desc": "GrocerEase",
      "sub": "HTML • CSS/Bootstrap • JavaScript",
      "extra": "Simple grocery web ordering system",
      "image": "assets/images/project3.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 1000);
    startAutoPlay();
  }

  void startAutoPlay() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!isPlaying) return;

      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;

      if (isPlaying) {
        startAutoPlay();
      } else {
        stopAutoPlay();
      }
    });
  }

  // 🔥 FULLSCREEN IMAGE POPUP (ICON ONLY BACK BUTTON)
  void openImage(String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: InteractiveViewer(
                    child: Image.asset(imagePath),
                  ),
                ),
              ),

              // 🔙 ICON ONLY BACK BUTTON
              Positioned(
                top: 30,
                left: 30,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget projectCard(Map<String, String> project) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openImage(project["image"]!),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(15, 93, 94, 94),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              project["image"]!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 495,
            decoration: const BoxDecoration(
              color: Color.fromARGB(15, 93, 94, 94),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Projects', style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight(600)
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 250,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index % projects.length;
                        });
                      },
                      itemBuilder: (context, index) {
                        final project = projects[index % projects.length];
                        return projectCard(project);
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Column(
                    children: [
                      Text(
                        projects[currentIndex]["desc"]!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: "Poppins",
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        projects[currentIndex]["sub"]!,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontFamily: "Poppins",
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        projects[currentIndex]["extra"]!,
                        style: const TextStyle(
                          color: Colors.white24,
                          fontFamily: "Poppins",
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(Icons.skip_previous, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: togglePlayPause,
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(Icons.skip_next, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),

          Experience(),
        ],
      ),
    );
  }
}