import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/LoginName/user_name.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:money_investment_track/Presentation/pages/main_screen.dart';

import 'package:provider/provider.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column content
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("asset/logo/lcslogo.png"),
              ),
              SizedBox(height: 40),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Enter Your Name',
                    textStyle: const TextStyle(
                      fontFamily: 'Jersey',
                      color: Color(0xff5E6BB3),
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                repeatForever: true,
                displayFullTextOnTap: true,
                stopPauseOnTap: false,
              ),
              SizedBox(height: 40), // Added space between the animated text and textfield
              SizedBox(
                width: 200,
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true, // Make the text field background color filled
                    fillColor: Color(0xfff2f2f2), // Set background color to light grey
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Color(0xff5E6BB3), // Border color visible
                        width: 2.0,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Color(0xff5E6BB3), // Focus border color visible
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Color(0xff5E6BB3), // Border when enabled
                        width: 2.0,
                      ),
                    ),
                    hintText: 'Enter your Name',

                    hintStyle: TextStyle(color: Colors.black45,fontFamily: 'Jersey',fontSize: 20), // Light gray for hint text
                  ),
                  style: TextStyle(color: Colors.black), // Text color inside textfield
                  cursorColor: Color(0xff5E6BB3), // Cursor color matching the theme
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  // Pass setState to the picking method
                  await _pickImageFromGallery(setState);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _selectedImage == null
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Colors.green,
                  ),
                  child: Text(
                    "Add Your Profile Image",
                    style: TextStyle(
                        color: _selectedImage == null
                            ? Colors.white
                            : Colors.white,
                        fontSize: 16,
                        fontFamily: "Jersey"),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  ProviderData myKey = context.read<ProviderData>();
                  final name = nameController.text;
                  final image  = _selectedImage;
                  UserName userName = UserName(name: name,profileImage: image);
                  if(name.isEmpty || image ==null){
                    myKey.showSnackBar(context, "Your Input is Wrong or Your Forgot to put image", false);
                  }
                  else{
                    myKey.showSnackBar(context, "Welcome $name", true);
                    myKey.addOrUpdateNameData(userName);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreenPage(),));
                  }

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  decoration: BoxDecoration(
                    color: Color(0xff5E6BB3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Submit",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,fontFamily: 'Jersey'),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  bool _isPickingImage = false; // Track image picking state
  File? _selectedImage; // Ensure this is accessible in the dialog

  Future<void> _pickImageFromGallery(StateSetter setState) async {
    if (_isPickingImage) return; // Prevent multiple invocations

    _isPickingImage = true; // Indicate picking is in progress
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    } finally {
      _isPickingImage = false; // Reset state after completion
    }
  }
}
