import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageService {
  Future<dynamic> getImage(context) async {
    final response = await showModalBottomSheet<Future<File?>>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () async {
                Get.back(result: pickImage(isGallery: false, context: context));
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                Get.back(result: pickImage(isGallery: true));
              },
            ),
          ],
        );
      },
    );
    return response;
  }

  static Future<File?> pickImage(
      {required bool isGallery, bool crop = false, context}) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    XFile? pickedFile;

    if (!isGallery) {
      PermissionStatus cameraStatus = await Permission.camera.request();
      if (cameraStatus == PermissionStatus.granted) {
        pickedFile = await ImagePicker().pickImage(
          source: source,
        );
        
      }
      if (cameraStatus == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("You need to provide camera permission")));
      }
      if (cameraStatus == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    } else {
      PermissionStatus storageStatus = await Permission.storage.request();
      if (storageStatus == PermissionStatus.granted) {
        pickedFile = await ImagePicker().pickImage(
          source: source,
        );
      }
      if (storageStatus == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("You need to provide camera permission")));
      }
      if (storageStatus == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }

    if (pickedFile == null) return null;

    return File(pickedFile.path);
  }
}
