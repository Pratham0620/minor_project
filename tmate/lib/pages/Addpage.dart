import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tmate/pages/homePage.dart';

class AddPage extends StatefulWidget{
  final TextEditingController cityController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddPage({Key? key}) :super(key: key);
  @override
  _AddPageState createState() => _AddPageState(); 
}

class _AddPageState extends State<AddPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body :Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  const BoxDecoration(
          gradient:LinearGradient (colors:[
          Color(0xff1d1e26),
          Color(0xff252041),]
        )
        ),
        child: SingleChildScrollView(child: Column(
          children: [
            SizedBox(height: 38,),
            IconButton(onPressed: (){Navigator.push(context,
             MaterialPageRoute(builder: (builder)=> Home()));},
              icon: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 28,
            )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Create",style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4
                  ),
                  ),
                  const SizedBox(height: 8),
                  const Text("Travel Story",style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  ),
                  const SizedBox(height:25,),
                  label("City"),  
                  const SizedBox(height: 12,),
                  title("City Name",),
                  const SizedBox(height: 30,),
                  label("Category"),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      ChipData("SOLO", 0xffff6d6e),
                      const SizedBox(
                        width: 20,
                      ),
                      ChipData("FRIENDS", 0xff2bc8d9), 
                    ]
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [ 
                        ChipData("FAMILY", 0xffff3d7e),
                        const SizedBox(
                          width: 20,
                        ),
                        ChipData("PROFFESSIONAL", 0xff556d6e),],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    label("Expenses"),
                    const SizedBox(height: 12,),
                    title("Money Spent?"),
                    const SizedBox(height: 12,),
                    label("Description"),
                    const SizedBox(height: 12,),
                    description(),
                    const SizedBox(height: 25,),
                  button(),
                ],
                ),

            ),
          ],
          ),
        ),
      ),
    );
  }
  Widget ChipData(String label,int color){
    return Chip(
      backgroundColor: Color(color),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(
        label,
        style:const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        )
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 3.8,)  
      );
  }

  Widget title(String label){
    return Container(
       height:55,
       width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
       ),
       child: TextFormField(
        style: const TextStyle(
          color: Colors.grey,
          fontSize:17,
        ),
        maxLines: null,
        decoration: InputDecoration(
          border:InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(
            color:Colors.grey,
            fontSize:17,
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
          )
        ),
       ),
       );
  }
  Widget description(){
    return Container(
       height:155,
       width: MediaQuery.of(context).size.width,
       decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(15),
       ),
       child: TextFormField(
        style: const TextStyle(
          color: Colors.grey,
          fontSize:17,
        ),
        maxLines: null,
        decoration: const InputDecoration(
          border:InputBorder.none,
          hintText: "Share Your Memories",
          hintStyle: TextStyle(
            color:Colors.grey,
            fontSize:17,
          ),
          contentPadding: EdgeInsets.only(
            left: 20,
            right: 20,
          )
        ),
       ),
       );
  }

  Widget label(String label){
    return Text(
      label,
      style: const TextStyle(
       color: Colors.white,
       fontWeight: FontWeight.bold,
       fontSize: 16.5,
       letterSpacing: 0.2,
     ),
     );
  } 
  
  Widget button(){
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xff8a32f1),
            Color(0xffad32f9),
          ]
          )
      ),
      child: const Center(
        child: Text("Add Blog",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        ),
        ),
    );
  }
}