import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:toast/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
 File image;
String imgUrl1;
 File newImage;
 String imgtesto;
 String _imageUrl;


 void initState() {
   super.initState();

   var ref = FirebaseStorage.instance.ref().child("images/");
   ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));
 }

  _showDialog(){
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Choose Picture from'),
actions: <Widget>[
  FlatButton(
    child: Text('Camera'),
  onPressed: uploadPic,
  ),
  FlatButton(
    child: Text('gallery'),
  onPressed: PickerGallery,
  ),
],
      );
    });
  }


 FirebaseStorage _storage = FirebaseStorage.instance;

 Future<Uri> uploadPic() async {

   //Get the file from the image picker and store it
   File image = await ImagePicker.pickImage(source: ImageSource.camera);

   //Create a reference to the location you want to upload to in firebase
   StorageReference reference = _storage.ref().child("images/");

   //Upload the file to firebase
   StorageUploadTask uploadTask = reference.putFile(image);
   Navigator.pop(context);
 }
  PickerGallery() async{
    print("Picker Gallery is called");
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("images/");
    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    Navigator.pop(context);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Container(
        child: Center(
          child: Center(
    child: _imageUrl == null ? Text('there are no pictures to display')
        :Image.network(_imageUrl,fit: BoxFit.cover,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
//        _showDialog,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
