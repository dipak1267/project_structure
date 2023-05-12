import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_structure/utils/extension.dart';
import '../constant/app_strings.dart';
import '../theme/theme.dart';

class PickFile {
  void openImageChooser(
      {required BuildContext context, required Function onImageChose}) {
    Platform.isIOS
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                child: Wrap(
                  children: [
                    ListTile(
                      title: photoLibraryText.appCommonText(
                          color: blackTextColor, align: TextAlign.start),
                      horizontalTitleGap: 0,
                      leading: const Icon(Icons.photo_library,
                          color: blackTextColor),
                      onTap: () {
                        _imageFormGallery(
                            context: context, onImageChose: onImageChose);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      horizontalTitleGap: 0,
                      title: cameraText.appCommonText(
                          color: blackTextColor, align: TextAlign.start),
                      leading:
                          const Icon(Icons.photo_camera, color: blackTextColor),
                      onTap: () {
                        _imageFromCamera(
                            context: context, onImageChose: onImageChose);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          )
        : showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: selectImageText.appCommonText(
                    color: buttonColor, weight: FontWeight.bold),
                children: [
                  ListTile(
                    title: photoLibraryText.appCommonText(
                        color: blackTextColor, align: TextAlign.start),
                    horizontalTitleGap: 0,
                    leading:
                        const Icon(Icons.photo_library, color: blackTextColor),
                    onTap: () {
                      _imageFormGallery(
                          context: context, onImageChose: onImageChose);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    horizontalTitleGap: 0,
                    title: cameraText.appCommonText(
                        color: blackTextColor, align: TextAlign.start),
                    leading:
                        const Icon(Icons.photo_camera, color: blackTextColor),
                    onTap: () {
                      _imageFromCamera(
                          context: context, onImageChose: onImageChose);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
  }

  void _imageFormGallery(
      {required BuildContext context, required Function onImageChose}) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (pickedFile != null) {
        // controller.addImage(File(pickedFile.files.single.path!));
        onImageChose(File(pickedFile.files.single.path!));
        log(pickedFile.files.single.path!);
      }
      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message: withoutPermissonAppCanErroText.tr,
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: settingsText.tr,
                    // textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      openAppSettings();
                    },
                  )
                : null,
            duration: const Duration(seconds: 3)),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
          message: toAccessThisFeturePleaseErrorText.tr,
          mainButton: SnackBarAction(
            label: settingsText.tr,
            textColor: Colors.amber,
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
  }

  void _imageFromCamera(
      {required BuildContext context, required Function onImageChose}) async {
    // var status = await Permission.camera.request();
    // if (status.isGranted) {
    //   final pickedFile = await ImagePicker()
    //       .pickImage(source: ImageSource.camera, imageQuality: 100);
    //   if (pickedFile != null) {
    //     // controller.addImage(File(pickedFile.path));
    //     onImageChose(File(pickedFile.path));
    //   }
    //   return;
    // }
    // else if (status.isDenied) {
    //   Get.showSnackbar(
    //     GetSnackBar(
    //         message: withoutPermissonAppCanErroText.tr,
    //         mainButton: Platform.isIOS
    //             ? SnackBarAction(
    //                 label: settingsText.tr,
    //                 // textColor: Theme.of(context).accentColor,
    //                 onPressed: () {
    //                   openAppSettings();
    //                 },
    //               )
    //             : SnackBarAction(
    //                 label: settingsText.tr,
    //                 // textColor: Theme.of(context).accentColor,
    //                 onPressed: () {
    //                   openAppSettings();
    //                 },
    //               ),
    //         duration: Duration(seconds: 3)),
    //   );
    //   return;
    // }
    // else if (status.isPermanentlyDenied) {
    //   Get.showSnackbar(
    //     GetSnackBar(
    //         message: toAccessThisFeturePleaseErrorText.tr,
    //         mainButton: SnackBarAction(
    //           label: settingsText.tr,
    //           textColor: Colors.amber,
    //           onPressed: () {
    //             openAppSettings();
    //           },
    //         ),
    //         duration: Duration(seconds: 3)),
    //   );
    //   return;
    // }
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      // controller.addImage(File(pickedFile.path));
      onImageChose(File(pickedFile.path));
    }
    return;
  }

  void pickFileFormStorage(
      {required BuildContext context,
      required List<String> allowedExtension,
      required Function onFileChose}) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: allowedExtension
          // allowedExtensions: ['doc', 'pdf'],
          );
      if (pickedFile != null) {
        // controller.addImage(File(pickedFile.files.single.path!));
        onFileChose(File(pickedFile.files.single.path!));
        log(pickedFile.files.single.path!);
      }
      return;
    } else if (status.isDenied) {
      Get.showSnackbar(
        GetSnackBar(
            message: withoutPermissonAppCanErroText.tr,
            mainButton: Platform.isIOS
                ? SnackBarAction(
                    label: settingsText.tr,
                    // textColor: Theme.of(context).accentColor,
                    onPressed: () {
                      openAppSettings();
                    },
                  )
                : null,
            duration: const Duration(seconds: 3)),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      Get.showSnackbar(
        GetSnackBar(
          message: toAccessThisFeturePleaseErrorText.tr,
          mainButton: SnackBarAction(
            label: settingsText.tr,
            textColor: Colors.amber,
            onPressed: () {
              openAppSettings();
            },
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }
  }
}
