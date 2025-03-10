import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_a_addict/Database/databaseMethods.dart';
import 'package:hack_a_addict/Screens/landingpage.dart';
import 'package:hack_a_addict/Screens/profilepage.dart';
import 'package:hack_a_addict/Screens/reportspage.dart';
import 'package:hack_a_addict/Utilities/stateManagement.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController();

  getQuizQuestions() async {

    if(Provider.of<StateManagement>(context, listen: false).quizQuestions.isEmpty) {
      QuerySnapshot questions = await DatabaseMethods().getQuizQuestions();
      List<Map<String, dynamic>> quizQuestions = [];

      for (var i in questions.docs) {
        quizQuestions.add(i.data() as Map<String, dynamic>);
      }
      log("$quizQuestions");

      if (mounted) {
        Provider.of<StateManagement>(context, listen: false).setQuizQuestions(quizQuestions);
      }
    }

  }

  getUserReports() async {
    if (Provider.of<StateManagement>(context, listen: false).userReports.isEmpty) {
      QuerySnapshot result = await DatabaseMethods().getReports(Provider.of<StateManagement>(context, listen: false).userID);
      List<Map<String, dynamic>> userReports = [];
      
      for (var i in result.docs) {
        userReports.add(i.data() as Map<String, dynamic>);
      }
      log("$userReports");
      if (mounted) {
        Provider.of<StateManagement>(context, listen: false).updateUserReports(userReports);
      }
    }
  }

  getQuotes() async {
    if (Provider.of<StateManagement>(context, listen: false).quote != "") {
      DocumentSnapshot result = await DatabaseMethods().getQuote();
      log("${result.data()}");
    }
  }

  @override
  void initState() {
    super.initState();
    getQuizQuestions();
    getQuotes();
    getUserReports();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(items: [
        SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home")),
        SalomonBottomBarItem(icon: Icon(Icons.list_alt_rounded), title: Text("Reports")),
        SalomonBottomBarItem(icon: Icon(Icons.person), title: Text("Profile")),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.deepPurple,
      onTap: (index) {
        _pageController.jumpToPage(index);
        setState(() {
          selectedIndex = index;
        });
      },
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          LandingPage(),
          ReportsPage(),
          ProfilePage()
        ],
      )
    );
  }
}