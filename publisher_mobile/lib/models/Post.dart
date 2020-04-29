import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Post {
  String userUid;
  String name;
  String content;
  String imageUrl;
  DateTime createdAt;

  Post({ this.userUid, this.name, this.content, this.imageUrl });
  Post.basic({this.userUid});

  Future create () async =>
    Firestore.instance
      .collection('posts')
      .document()
      .setData({
        'user': 'users/$userUid',
        'name': this.name,
        'content': this.content,
        'imageUrl': this.imageUrl,
        'createdAt': new DateTime.now().toIso8601String()
      });

  Widget toListView() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').where('user', isEqualTo: 'users/$userUid').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
        default:
          return snapshot.data.documents.length > 0
            ? new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile( //TODO: estudar essa classe
                  title: new Text(document['name']),
                  subtitle: new Text(document['createdAt']),
                );
              }).toList())
            : Text('Nada aqui por enquanto ;D');
        }
    });
  }
}