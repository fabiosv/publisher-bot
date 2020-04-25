import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class CreatePost extends StatefulWidget {
  CreatePost();

  @override
  _CreatePost createState() => _CreatePost();
}

class _CreatePost extends State<CreatePost> {
  String postName = '';
  File _image;
  String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar um novo post'), actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: uploadImage,
            child: Icon(
              Icons.save,
              size: 26.0,
            ),
        )),
      ],),
      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        child: Form(child: Column(
          children: <Widget>[
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

  Future uploadImage() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

}