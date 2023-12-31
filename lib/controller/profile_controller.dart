import 'dart:io';
import 'package:facebook/view/widgets/assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileController with ChangeNotifier {
  TextEditingController username = TextEditingController();
  FilePickerResult? pickedfile;
  Uint8List? webImage;
  File? image;
  final User? _user = FirebaseAuth.instance.currentUser;

  pickImage() async {
    pickedfile = await FilePicker.platform.pickFiles(type: FileType.image);
    if (pickedfile != null) {
      kIsWeb
          ? webImage = pickedfile!.files.single.bytes
          : image = File(pickedfile!.files.single.path!);
      notifyListeners();
    } else {
      showSnackbar(message: 'No Image selected');
    }
  }

  void refresh() => notifyListeners();

  Future<void> updateProfile() async {
    if (image != null || webImage != null) {
      try {
        storage.FirebaseStorage fbStorage = storage.FirebaseStorage.instance;
        storage.Reference refRoot = fbStorage.ref().child('USER-profileData');
        storage.Reference ref = refRoot.child('profileImage${_user!.uid}.jpg');

        if (pickedfile != null) {
          showSnackbar(message: 'uploading...');
          kIsWeb
              ? await ref.putData(pickedfile!.files.single.bytes!)
              : await ref.putFile(File(pickedfile!.files.single.path!));
          String imageURL = await ref.getDownloadURL();
          await _user!.updatePhotoURL(imageURL);
        } else {
          showSnackbar(message: 'No Image Selected!');
        }
      } on FirebaseException {
        showSnackbar(message: 'Firebase error occured!');
      } catch (e) {
        showSnackbar(message: 'something unexpected occured!');
      }
    }
    await _user!.updateDisplayName(username.text);
    notifyListeners();
    showSnackbar(message: 'Profile Updated');
  }

  myAnimation({String title = 'Next', bool progress = false}) {
    Widget btn = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title),
      const SizedBox(width: 8),
      progress == false
          ? const Icon(Icons.arrow_forward_rounded)
          : const SizedBox(
              height: 24, width: 24, child: CircularProgressIndicator())
    ]);
    notifyListeners();
    return btn;
  }
}
