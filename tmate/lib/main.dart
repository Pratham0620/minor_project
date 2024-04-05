
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmate/pages/homePage.dart';
import 'package:tmate/pages/signup.dart';
import 'package:tmate/services/Auth_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: 'AIzaSyDk1UZu_vy3Fe3uc7XibzaNuhuV1aeme10',
    appId: '1:1057372240312:android:ed97e5ab7dceddb1adb74d',
    messagingSenderId: '1057372240312',
    projectId: 'minor-project-travelmate',
  ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  Widget currentPage = const signUpPage();
  Authclass authClass = Authclass();

  @override
  void initState(){
    super.initState();
  }

  void checkLLogin()async
{
  String? token = await authClass.getToken();
  if(token!=null){
    setState(() {
      currentPage= const homePage();
    });
  }
}
  @override
  Widget build(BuildContext context){
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TravelMate",
      home :  currentPage,
    );
  }
}