import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:tmate/pages/homePage.dart';
import 'package:tmate/pages/signIn.dart';
import 'package:tmate/services/Auth_services.dart';


// ignore: camel_case_types
class signUpPage extends StatefulWidget{
  const signUpPage({super.key});

  @override
  _signUpPage createState() => _signUpPage();
  }
  
  class _signUpPage extends State<signUpPage>{
    firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _pwdController = TextEditingController();
    bool circular = false;
    Authclass authclass = Authclass();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize:35,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonSize("assets/images/google.svg", "  Continue with Google", 25,()async{
                  await authclass.googlesignin(context);
                }),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                textfield("Email",_emailController,false),
                const SizedBox(
                  height: 10,
                ),
                textfield("Password",_pwdController,true),
                const SizedBox(
                  height: 20,
                ),
                SignupButton(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "if you already have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,
                         MaterialPageRoute(builder: (builder) => const signInPage()),
                          (route) => false);
                      },
                      child: const Text(
                      "LogIn",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),)
                    ,
                  ],
                )
              ],
            ),
        ),
        )
      );
    }
  // ignore: non_constant_identifier_names
  Widget ButtonSize(String imagePath , String buttonText , double size,void Function()? onTap){
    return InkWell(
      onTap: onTap,
      child: SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              height: 60,
              child: Card(
                elevation: 8,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(width:1, color: Colors.white)
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(imagePath,
                    height: size,
                    width: size,
                    ),
                    Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white,fontSize: 17 ),
                    ),
                ]
                ),
              ),
            ),
    );
  }
  Widget textfield(String labelText,TextEditingController controller,bool obscuretext){
    return SizedBox(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller ,
        obscureText: obscuretext,
        style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
           ),
        decoration: InputDecoration(
          labelText: labelText, 
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
           ),
           focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  const BorderSide(
              width:1.5,
              color: Colors.amber)
           ),
           enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width:1, 
              color: Colors.grey
              ),
           )
           ),
    ),

    );
  }
  Widget SignupButton(){
    return InkWell(
      onTap: () async{
        setState(() {
          circular = true;
        });
        try{
          firebase_auth.UserCredential userCredential =  await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, 
          password: _pwdController.text);
          print(userCredential.user?.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(context, 
          MaterialPageRoute(builder: (builder) => const homePage()), 
          (route) => false);
        }
        catch(e){
          final snackbar = SnackBar(content:Text(e.toString()) );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }

        
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 140,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue),
        child:  Center(
          child:circular 
          ? const CircularProgressIndicator() 
          :const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ),
    );
  }
  }
  