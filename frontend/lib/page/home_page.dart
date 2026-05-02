import 'package:flutter/material.dart';
import 'package:frontend/widgets/home_page_widgets/about_widgets/about_section.dart';
import 'package:frontend/widgets/home_page_widgets/contact_widgets/contact.dart';
import 'package:frontend/widgets/home_page_widgets/footer_widgets/footer.dart';
import 'package:frontend/widgets/home_page_widgets/header.dart';
import 'package:frontend/widgets/home_page_widgets/projects_widgets/project_section.dart';
import 'package:frontend/widgets/home_page_widgets/skills_widgets/skills_section.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: ListView(
      children: [
        Header(),
        AboutSection(),
        SizedBox(height: 10,),
        SkillsSection(),
        SizedBox(height: 10,),
        ProjectSection(),
        SizedBox(height: 10,),
        Contact(),
        Footer(),
        ],
      ),
    );
  }
}