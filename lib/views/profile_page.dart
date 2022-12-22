import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_webdev/views/login_page.dart';
import 'package:learn_webdev/widgets/auth_button.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isOnEditMode = false;

  String? profilePicUrl;

  uploadImage() async {
    final firebaseStorage = FirebaseStorage.instance;
    final imagePicker = ImagePicker();
    XFile? image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isDenied) {
      //Select Image
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      var file = File(image?.path as String);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await firebaseStorage
            .ref()
            .child(
                'userprofilepic/${FirebaseAuth.instance.currentUser!.uid}-profilepic')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        print(downloadUrl);

        FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadUrl);

        setState(() {
          profilePicUrl = downloadUrl;
        });
      } else {
        if (kDebugMode) {
          print('No Image Path Received');
        }
      }
    } else {
      if (kDebugMode) {
        print('Permission not granted. Try Again with permission access');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController.text =
        FirebaseAuth.instance.currentUser!.displayName as String;
    emailController.text = FirebaseAuth.instance.currentUser!.email as String;
    profilePicUrl = FirebaseAuth.instance.currentUser!.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Profile Page"),
        actions: [
          InkWell(
            onTap: () => setState(() {
              isOnEditMode = true;
            }),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: isOnEditMode ? Container() : const Icon(Icons.edit)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: isOnEditMode ? () async => uploadImage() : null,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(profilePicUrl as String)),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildProfileField(usernameController),
                const SizedBox(
                  height: 20,
                ),
                _buildProfileField(emailController),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    child: isOnEditMode
                        ? AuthButton(
                            label: "Save",
                            onTap: () async {
                              FirebaseAuth.instance.currentUser!
                                  .updateEmail(emailController.text);

                              FirebaseAuth.instance.currentUser!
                                  .updateDisplayName(usernameController.text);

                              setState(() {
                                isOnEditMode = false;
                              });
                            })
                        : AuthButton(
                            label: "Log Out",
                            onTap: () {
                              FirebaseAuth.instance.signOut();

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                  (route) => false);
                            })),
              ],
            )),
      ),
    );
  }

  TextFormField _buildProfileField(TextEditingController controller) {
    return TextFormField(
      enabled: isOnEditMode,
      decoration: const InputDecoration(isDense: true),
      style: TextStyle(
        color: isOnEditMode ? Colors.black : Colors.grey,
      ),
      controller: controller,
    );
  }
}
