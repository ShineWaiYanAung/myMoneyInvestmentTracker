import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/CryptoEntity/cryptoModel.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:money_investment_track/main.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _tlAlignAnim;
  late Animation<Alignment> _brAlignAnim;


  @override
  void initState() {
    super.initState();
    // Increase duration to 16 seconds for a slower animation
    _controller = AnimationController(
        duration: Duration(microseconds: 1000), vsync: this);

    _tlAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final TextEditingController _cryptoNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: [
          // Header Container
          Container(
            height: height * 0.3,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: height * 0.07,
                  backgroundColor: Colors.white,
                  child: Image.asset("asset/person/maleStudent.png"),
                ),
                SizedBox(height: 20),
                Text(
                  "Shine Wai Yan Aung",
                  style: TextStyle(
                    fontFamily: "Jersey",
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 1,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),

          // Card for Profile
          Card(
            color: Theme.of(context).focusColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to profile screen
              },
            ),
          ),
          SizedBox(height: 20),
          // Card for About App
          Card(
            color: Theme.of(context).focusColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('About App', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),

          // Card for Grading
          Card(
            color: Theme.of(context).focusColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.grade, color: Colors.white),
              title: Text('Grading', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ),
          Spacer(),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: _tlAlignAnim.value,
                    end: _brAlignAnim.value,
                    colors: [
                      Colors.red,
                      Colors.blueAccent,
                    ],
                  ),
                  shape: BoxShape.circle),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: _tlAlignAnim.value,
                      end: _brAlignAnim.value,
                      colors: [
                        Colors.blueAccent,
                        Colors.red,
                      ],
                    ),
                    color: Theme.of(context).focusColor,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    showDataInserterDialog(context);
                  },
                  icon: Icon(
                    size: height * 0.06,
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void showDataInserterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // Using a StatefulBuilder to manage the state inside the dialog
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(30),
              backgroundColor: Theme.of(context).focusColor,
              title: Center(
                child: Text(
                  "Enter Your Crypto",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Jersey"),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _cryptoNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Crypto Name',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      // Pass setState to the picking method
                      await _pickImageFromGallery(setState);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _selectedImage == null ? Colors.white : Colors.green,
                      ),
                      child: Text(
                        "Add Image",
                        style: TextStyle(
                            color: _selectedImage == null ? Theme.of(context).focusColor:Colors.white,
                            fontSize: 16,
                            fontFamily: "Jersey"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    final ProviderData _myProviderKey = context.read<ProviderData>();
                    if (_selectedImage == null || _cryptoNameController.text.isEmpty) {
                      _myProviderKey.showSnackBar(context, "You Missed the One Data to Put", false);
                      return;
                    }
                    final String cryptoName = _cryptoNameController.text;
                    final File selectedImage = _selectedImage!;
                    final CryptoModel myDataFromDialog = CryptoModel(cryptoName: cryptoName, cryptoImage: selectedImage);

                    _myProviderKey.insertingData(myDataFromDialog);
                    _myProviderKey.showSnackBar(context, "Successfully Added the Data", true);
                    setState(() {
                      _selectedImage = null; // Move this inside setState
                      _cryptoNameController.clear(); // You can keep this here as well
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                          fontFamily: "Jersey"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectedImage = null;
                    _cryptoNameController.clear();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(
                      "Close",
                      style: TextStyle(
                          color: Theme.of(context).focusColor,
                          fontSize: 16,
                          fontFamily: "Jersey"),
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  bool _isPickingImage = false; // Track image picking state
  File? _selectedImage; // Ensure this is accessible in the dialog

  Future<void> _pickImageFromGallery(StateSetter setState) async {
    if (_isPickingImage) return; // Prevent multiple invocations

    _isPickingImage = true; // Indicate picking is in progress
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
