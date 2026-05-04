import 'package:flutter/material.dart';
import 'package:frontend/widgets/home_page_widgets/about_widgets/about_section.dart';
import 'package:frontend/widgets/home_page_widgets/contact_widgets/contact.dart';
import 'package:frontend/widgets/home_page_widgets/footer_widgets/footer.dart';
import 'package:frontend/widgets/home_page_widgets/header.dart';
import 'package:frontend/widgets/home_page_widgets/projects_widgets/project_section.dart';
import 'package:frontend/widgets/home_page_widgets/skills_widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToContact() {
    final context = _contactKey.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: [
          Header(onMessageClick: scrollToContact),
          AboutSection(),
          SizedBox(height: 10),
          SkillsSection(),
          SizedBox(height: 10),
          ProjectSection(),
          SizedBox(height: 10),
          Container(key: _contactKey, child: Contact()),
          Footer(),
        ],
      ),
    );
  }
}
