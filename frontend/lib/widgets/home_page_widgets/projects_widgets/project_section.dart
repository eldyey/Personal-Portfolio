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

  int currentIndex = 0;

  Color text(BuildContext context) =>
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

  Color bg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color.fromARGB(15, 93, 94, 94)
      : Colors.white;

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

  void openImage(String imagePath) {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Center(child: InteractiveViewer(child: Image.asset(imagePath))),

              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
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
            color: bg(context),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(project["image"]!, fit: BoxFit.cover),
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
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                      color: text(context),
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Featured works:',
                    style: TextStyle(
                      color: muted(context),
                      fontFamily: "Poppins",
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
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
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      double page = 0;

                      if (_controller.hasClients && _controller.page != null) {
                        page = _controller.page!;
                      } else {
                        page = currentIndex.toDouble();
                      }

                      final progress =
                          (page % projects.length) / projects.length;

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 4,
                          width: 455,
                          child: Stack(
                            children: [
                              Container(color: muted(context).withOpacity(0.2)),
                              FractionallySizedBox(
                                widthFactor: progress,
                                child: Container(color: text(context)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  Column(
                    children: [
                      Text(
                        projects[currentIndex]["desc"]!,
                        style: TextStyle(
                          color: muted(context),
                          fontFamily: "Poppins",
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        projects[currentIndex]["sub"]!,
                        style: TextStyle(
                          color: faint(context),
                          fontFamily: "Poppins",
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        projects[currentIndex]["extra"]!,
                        style: TextStyle(
                          color: faint(context),
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
                        icon: Icon(Icons.skip_previous, color: text(context)),
                      ),
                      IconButton(
                        onPressed: togglePlayPause,
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: text(context),
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(Icons.skip_next, color: text(context)),
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
