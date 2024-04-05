import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tmate/pages/homePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Authclass{

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
FirebaseAuth auth = FirebaseAuth.instance;
final storage = const FlutterSecureStorage();

Future<void> googlesignin(BuildContext context) async{
  try{
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if(googleSignInAccount!=null){
      GoogleSignInAuthentication googleSignInAuthentication = 
      await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = 
        await auth.signInWithCredential(credential);
        storeTokenAndData(userCredential);
        Navigator.pushAndRemoveUntil(context,
         MaterialPageRoute(builder: (builder)=> const homePage()),
         (route) => false);
        } 
      catch (e){
        final snackbar = SnackBar(content:Text(e.toString()) );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
    else{
      const snackbar = SnackBar(content:Text("Not able to Sign In") );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
  catch(e){
    final snackbar = SnackBar(content:Text(e.toString()) );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
  Future<void> storeTokenAndData(UserCredential userCredential)async{
    await storage.write(key: "token", value: userCredential.credential?.token.toString() );
    await storage.write(key: "token", value: userCredential.credential.toString() );
  }
  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
  Future<void> logout(BuildContext context)async{
    try{
      _googleSignIn.signOut();
      await auth.signOut();
      await storage.delete(key: "'token"); 
    }
    catch(e){
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}