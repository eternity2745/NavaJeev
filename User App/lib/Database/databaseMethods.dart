import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_string/random_string.dart';

class DatabaseMethods {

  String email = "";
  String username = "";


  FirebaseFirestore database = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  getcurrentUser() async {
    // ignore: await_only_futures
    return await auth.currentUser;
  }

  Future userLogin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future userSignUp(String email, String username, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      log("Created");
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future addUserInfo(Map<String, dynamic> userInfo, String? id) async {
    try {
      log("Adding");
      return await database.collection("users").doc(id).set(userInfo);
    } catch (e) {
      return false;
    }
  }

  Future<QuerySnapshot> getUserInfo(String email) async {
    return await database.collection("users").where("email", isEqualTo: email).get();
  }

  Future<QuerySnapshot> getQuizQuestions() async {
    return await database.collection("quiz").get();
  }

  Future addUserReport(Map<String, dynamic> reportInfo, String reportID, String id) async {
    try {
      log("Adding");
      await database.collection("reports").doc(reportID).set(reportInfo);
      await database.collection("users").doc(id).update({"reports": FieldValue.increment(1)});
    } catch (e) {
      return false;
    }
  }

  Future updateHighScore(Map<String, dynamic> highScore, String id) async {
    try {
      await database.collection("users").doc(id).update(highScore);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<QuerySnapshot> getReports(int userID) async {
    return await database.collection("reports").where("userID", isEqualTo: userID).get();
  }

  Future changePassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<DocumentSnapshot> getQuote() async {
    int id = randomBetween(1, 20);
    DocumentSnapshot result = await database.collection("quotes").doc("$id").get();
    return result;
  }

  Future logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      log("$e");
    }
  }
}