import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  final int _imageQuality = 70;
  final double _maxW = 800;
  final double _maxH = 800;

  void openCamera(Function(String?) result) async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: _imageQuality,
        maxWidth: _maxW,
        maxHeight: _maxH);
    if (image != null) {
      result(image.path);
    }
  }

  void openGallery(Function(String?) result) async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: _imageQuality,
        maxWidth: _maxW,
        maxHeight: _maxH);
    if (image != null) {
      result(image.path);
    }
  }

  void chooseImagesFromGallery(Function(List<String>?) results) async {
    List<XFile>? images = await ImagePicker().pickMultiImage(
        imageQuality: _imageQuality, maxWidth: _maxW, maxHeight: _maxH);
    var result = images.map((e) => e.path).toList();
    results(result);
  }

  Future<void> showDialog(
      BuildContext context, Function(String?) result) async {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.only(
              bottom: 40,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        Navigator.of(bc).pop();
                        openCamera((file) {
                          result(file);
                        });
                      },
                      leading: const Icon(
                        Icons.photo_camera,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Chọn từ máy ảnh',
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(bc).pop();
                        openGallery((file) {
                          result(file);
                        });
                      },
                      leading: const Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Chọn từ thư viện',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Future<void> showMultiImages(
      BuildContext context,
      {required Function(List<String>? images) onGallery,
      required Function(String? image) onCamera}) async {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.only(
              bottom: 40,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        Navigator.of(bc).pop();
                        openCamera((file) {
                          onCamera(file);
                        });
                      },
                      leading: const Icon(
                        Icons.photo_camera,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Chọn từ máy ảnh',
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(bc).pop();
                        chooseImagesFromGallery((file) {
                          onGallery(file);
                        });
                      },
                      leading: const Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Chọn từ thư viện',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

abstract class ImagePickerListener {
  void pickImage(File _image);
}
