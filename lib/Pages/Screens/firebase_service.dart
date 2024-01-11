import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseService {
  late String url;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  //UPLOAD FILE
  Future<String> uploadFile(File file, String fileName) async {
    Reference ref = _storage.ref().child(fileName);
    UploadTask uploadTask = ref.putFile(file);
    //wait till the file is uploaded to get the downloadUrl
    await uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();
    }).catchError((error) {
      return error;
    });
    return url.toString();
  }

  //ADD MILESTONE
  Future addMilestone(
      String title, String description, String photoLink, String date) async {
    final file = <String, String>{
      "title": title,
      'date': date,
      "desc.": description,
      "photoLink": photoLink
    };

    _firestore
        .collection("userData")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('milestones')
        .doc(title)
        .set(file)
        .onError((e, _) => e);
  }
}
