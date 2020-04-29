import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:publisher_mobile/models/User.dart';

import '../models/Post.dart';
import '../models/User.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePost createState() => _CreatePost();
}

class _CreatePost extends State<CreatePost> {
  User user;
  String postName = '';
  String content;
  File _image;
  String _uploadedFileURL;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final uid = User.of(context).uid;
    //print('CreatePost - $uid');
    return Scaffold(
      appBar: AppBar(title: Text('Criar um novo post'), actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: savePost,
            child: Icon(
              Icons.save,
              size: 26.0,
            ),
        )),
      ],),
      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome do Post'),
              keyboardType: TextInputType.text,
              onSaved: (String value) {
                setState(() {
                  postName = value;
                });
              },
            ),
            SizedBox(height: 30,),
            _image != null
              ? Image.asset(_image.path, height: 150,)
              : Container(height: 150,),
            RaisedButton(
              child: Text('Escolha uma Imagem'),
              onPressed: chooseFile,
              color: Colors.cyan,),
            TextField(
              decoration: const InputDecoration(labelText: 'Escreva uma mensagem...'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (String value) {
                setState(() {
                  content = value;
                });
              },
            ),

          ]))
      ))
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  void savePost() async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await uploadImage();
      Post(userUid: 'user.uid',
        name: this.postName,
        content: this.content,
        imageUrl: this._uploadedFileURL,);
      Fluttertoast.showToast(msg: "Post salvo!");
    }
  }

  Future uploadImage() async {
    // https://www.c-sharpcorner.com/article/upload-image-file-to-firebase-storage-using-flutter/
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    Fluttertoast.showToast(msg: "Imagem salva ");
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

}