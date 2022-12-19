import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_webdev/model/user_model.dart';

class UserDatabase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference reference = firestore.collection('users');

  static void create(String docID, UserModel userModel) {
    reference.doc(docID).set(userModel.toJson());
  }

  static void update(String docID, UserModel userModel) {
    reference.doc(docID).set(userModel.toJson());
  }

  static Future<DocumentSnapshot> read(String docID) async {
    var document =
        await FirebaseFirestore.instance.collection('users').doc(docID);

    return document.get();
  }
}
