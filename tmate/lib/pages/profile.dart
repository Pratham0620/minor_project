import 'package:flutter/material.dart';
import 'package:tmate/pages/homePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        leading: IconButton(
          color: Colors.amber,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> Home()));
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap the content in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ageController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cityController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: mobileController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: genderController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save the user's input data here
                  // For example, you can print the data:
                  print('Name: ${nameController.text}');
                  print('Age: ${ageController.text}');
                  print('City: ${cityController.text}');
                  print('Mobile Number: ${mobileController.text}');
                  print('Gender: ${genderController.text}');
                },
                child: Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
