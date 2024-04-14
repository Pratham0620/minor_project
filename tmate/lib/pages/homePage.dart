import  'package:flutter/material.dart';
import 'package:tmate/constants/colors.dart';
import 'package:tmate/pages/Addpage.dart';
import 'package:tmate/pages/profile.dart';
import 'package:tmate/pages/signup.dart';
import 'package:tmate/services/Auth_services.dart';
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Authclass authclass = Authclass();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TravelMate',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Simulate some initialization tasks or delay
    await Future.delayed(const Duration(seconds: 2)); // Change the duration as needed

    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green], // Dual colors horizontally
                ),
              ),
              child: const Text(
                'TravelMate',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Add spacing between the text and image
            Image.asset(
              'assets/images/traveller.jpg', // Replace with your image asset path
              width: 200.0, // Adjust width as needed
            ),
          ],
        ),
      );
  }
}

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      drawer: NavDrawer(),
      appBar: buildApp(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child:ListView(
                children: [
                  Container(
                    margin:const EdgeInsets.only(top:20,bottom: 20),
                    child: const Text(
                      'Travel-History',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.amberAccent
                      ),
                    ),
                  ),

                ],
              )
            ) 
          ], 
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
        currentIndex: 0, // Set the initial index (Home tab)
        onTap: (index) {
          // Handle tab selection
          switch (index) {
            case 0:
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> Home()));
              // Navigate to Home screen
              // You can use Navigator.push() or any other navigation method
              break;
            case 1:
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> AddPage()));
              // Navigate to Add screen
              break;
            case 2:
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> Home()));
              // Navigate to Explore screen
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white),
            label:"Home",
            
          ),
          BottomNavigationBarItem(
           icon:Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Colors.indigoAccent,
                  Colors.purple,
                ])
              ),
              child: Icon(Icons.add),                    
            ),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,color: Colors.white,),
            label: 'Explore',
          ),
        ],
      ),
    );  
  }

  Widget searchBox(){
    return Container(
              padding: const EdgeInsets.symmetric(horizontal:20 , vertical: 7),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20)
              ),
              child:const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                    size: 15,
                  ),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20,maxWidth: 25),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: tdGrey),
                ),
              )
    );
  }

  AppBar buildApp() {
    return AppBar(
      backgroundColor:Colors.black87,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('TravelMate',style: TextStyle(color: Colors.white),),
          // ignore: sized_box_for_whitespace
          Container(
            height: 40,
            width: 40,
            child: ClipOval(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/logo.jpg')
              )
            ),
          )
        ]
      ),
    );
  }
}

// ignore: must_be_immutable
class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});
  Authclass authClass = Authclass();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.amber.shade300,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.pushAndRemoveUntil(context, 
              MaterialPageRoute(builder: (builder)=>  ProfilePage()), 
              (route) => false)},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await authClass.logout(context);
              Navigator.pushAndRemoveUntil(context, 
              MaterialPageRoute(builder: (builder)=> const signUpPage()), 
              (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

/*class AddBlogPage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Travel Story'),
      ), 
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: expensesController,
              decoration: const InputDecoration(labelText: 'Total Expenses'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement blog storing functionality here
                // For demonstration purposes, we'll print the values to the console
                print('City: ${cityController.text}');
                print('Total Expenses: ${expensesController.text}');
                print('Description: ${descriptionController.text}');

                // Optionally, you can navigate back to the home page after storing the blog
                Navigator.pop(context);
              },
              child: const Text('Save Blog'),
            ),
          ],
        ),
      ),
    );
  }*/
