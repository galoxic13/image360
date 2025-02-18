import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

   @override
   State<HomePage> createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{

  File ? _selectedImage;
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Container(
  width: double.infinity, // Ensure it takes full screen width
  height: double.infinity, // Ensure it takes full screen height
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(210, 20, 118, 210),
        Color.fromARGB(255, 244, 170, 195),
        Color.fromARGB(255, 232, 165, 244)
      ], 
      begin: Alignment.topLeft, 
      end: Alignment.bottomRight,
    ),
  ),

  child: Column(
  mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
  crossAxisAlignment: CrossAxisAlignment.center, // Align children to the center
  children: [
    SizedBox(
      width: 250, // Set equal width for both buttons
      child: MaterialButton(
        color: Colors.lightBlue,
        child: const Text(
          'Pick Image from Gallery',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          
          _pickImageFromGallery();
          }
      ),

    ),
    const SizedBox(height: 20),
    _selectedImage != null ? Image.file(_selectedImage!,
                    width: 400, 
                    height: 400,
                    fit: BoxFit.cover,) : const Text("Please select an image"),
    const SizedBox(height: 10), // Space between buttons
    SizedBox(
      width: 250, // Same width as the first button
      child: MaterialButton(
        color: Colors.redAccent,
        child: const Text(
          'Capture Image from Camera',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          
          _pickImageFromCamera();

        },
      ),
    ),
  ],//children
),

),

    appBar: AppBar(
        title: Text(
          'IMAGE 360',
           style: TextStyle(
            color: const Color.fromARGB(255, 227, 214, 214),
            fontSize: 25,
            fontWeight: FontWeight.bold
           ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

    );
   
  }

  Future _pickImageFromGallery() async {
      final  returnedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
      
      if(returnedImage == null)return;
      setState((){
        _selectedImage = File(returnedImage.path);    
      });
    }

    Future _pickImageFromCamera() async {
      final  returnedImage =  await ImagePicker().pickImage(source: ImageSource.camera);
      
      if(returnedImage == null)return; 
      setState((){
        _selectedImage = File(returnedImage.path);    
      }); 
    }

}

  
  
 

  






// Future<void> getLostData() async {
//   final ImagePicker picker = ImagePicker();
//   final LostDataResponse response = await picker.retrieveLostData();
//   if (response.isEmpty) {
//     return;
//   }
//   final List<XFile>? files = response.files;
//   if (files != null) {
//     _handleLostFiles(files);
//   } else {
//     _handleError(response.exception);
//   }
// }