import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../basic_features.dart';
import '../storage/preference_storage.dart';
import '../widgets/custom_text_widget.dart';
import 'logger_util.dart';

class AppUtils {
  AppUtils._();

  static final instance = AppUtils._();

  double bottomPadding(BuildContext context) {
    // print("bottomPadding    ${buttonHeight(context)}");
    return buttonHeight(context) + MediaQuery.of(context).padding.bottom;
  }

  double buttonHeight(BuildContext context) {
    // print("AppBar().preferredSize.height    ${AppBar().preferredSize.height}");
    return AppBar().preferredSize.height;
  }
}

Future showPermissionDialog(
    {String? title,
    String? content,
    String? cancelText,
    Function? noFunction,
    String? yesText,
    Function? yesFunction}) {
  return showCupertinoDialog(
    context: Get.context!,
    builder: (context) => Theme(
      data: ThemeData.light(),
      child: CupertinoAlertDialog(
        title: Text(title!, style: fontStyleMedium16),
        content: Text(content!, style: fontStyleRegular12),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(cancelText!, style: fontStyleMedium16),
            onPressed: () => noFunction!(),
          ),
          CupertinoDialogAction(
            child: Text(yesText!, style: fontStyleMedium16),
            onPressed: () => yesFunction!(),
          ),
        ],
      ),
    ),
  );
}

// Future versionUpdates(
//     {required BuildContext context, required bool isUpdateAvailable}) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//         title: const Text(AppString.versionUpdate),
//         content: isUpdateAvailable
//             ? const Text(AppString.versionUpdateDes)
//             : Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Image.asset(ImageAsset.icAnswerTick,
//                       height: Dimensions.h24, width: Dimensions.w24),
//                   SizedBox(
//                     width: Dimensions.w5,
//                   ),
//                   const Text(AppString.upToDateDes),
//                 ],
//               ),
//         actions: isUpdateAvailable
//             ? <Widget>[
//                 TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text(AppString.later)),
//                 TextButton(
//                     onPressed: () async {
//                       Navigator.pop(context);
//                       OpenStore.instance
//                           .open(androidAppBundleId: Const.instance.packageName);
//                     },
//                     child: const Text(AppString.updateNow)),
//               ]
//             : [],
//       );
//     },
//   );
// }

Future imageSelectionDialog({
  required BuildContext context,
  required Function selectedFile,
}) {
  FocusScope.of(context).requestFocus(FocusNode());

  return showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return SimpleDialog(
        backgroundColor: Colors.white,
        title:
            Text(AppString.selectImagePickerType, style: fontStyleSemiBold15),
        //    content: new Text("Select images picker type.",style:TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),),
        children: <Widget>[
          SimpleDialogOption(
            child: Text(
              AppString.camera,
              style: fontStyleMedium13,
            ),
            onPressed: () async {
              Navigator.pop(context);
              // StartupService.setSaveImageInGallery(
              // await getFileSaverPermission());

              final canUseStorage = await Permission.camera.status;
              if (canUseStorage.isGranted) {
                XFile? imageFile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (imageFile != null) {
                  XFile compsImg =
                      await Const.getCompressionImage(imageFile.path);
                  selectedFile(compsImg);
                }
              } else if (canUseStorage.isDenied ||
                  canUseStorage.isPermanentlyDenied) {
                if (PreferenceStorage.getFirstPermissionCamera() == false) {
                  await Permission.camera.request().then((value) async {
                    if (value.isGranted) {
                      XFile? imageFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (imageFile != null) {
                        XFile compsImg =
                            await Const.getCompressionImage(imageFile.path);
                        selectedFile(compsImg);
                      }
                    }
                  });
                }

                if (PreferenceStorage.getFirstPermissionCamera()) {
                  showPermissionDialog(
                    noFunction: () {
                      Navigator.pop(Get.context!);
                    },
                    cancelText: AppString.permissionCancel,
                    yesText: AppString.permissionSetting,
                    content: AppString.cameraPermissionDesc,
                    title: AppString.cameraPermission,
                    yesFunction: () {
                      Navigator.pop(Get.context!);
                      openAppSettings();
                    },
                  );
                }

                if (kDebugMode) {
                  print(
                      " Permission.camera.isPermanentlyDenied===> ${await Permission.camera.isPermanentlyDenied}");
                }
              }
              PreferenceStorage.setFirstPermissionCamera(true);
            },
          ),
          SimpleDialogOption(
            child: Text(AppString.gallery, style: fontStyleMedium13),
            onPressed: () async {
              Navigator.pop(context);
              final canUseStorage = await Permission.photos.status;
              int version = 21;
              if (Platform.isAndroid) {
                var androidInfo = await DeviceInfoPlugin().androidInfo;
                version = androidInfo.version.sdkInt;
              }
              if (canUseStorage.isGranted ||
                  (Platform.isAndroid && version < 33)) {
                XFile? imageFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (imageFile != null) {
                  XFile compsImg =
                      await Const.getCompressionImage(imageFile.path);

                  await selectedFile(compsImg);
                }
              } else if (canUseStorage.isDenied ||
                  canUseStorage.isPermanentlyDenied ||
                  canUseStorage.isLimited) {
                if (PreferenceStorage.getFirstPermissionPhoto() == false) {
                  await Permission.photos.request().then((value) async {
                    if (value.isGranted) {
                      XFile? imageFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (imageFile != null) {
                        XFile compsImg =
                            await Const.getCompressionImage(imageFile.path);

                        await selectedFile(compsImg);
                      }
                    }
                  });
                }
                if (PreferenceStorage.getFirstPermissionPhoto()) {
                  showPermissionDialog(
                    noFunction: () {
                      Navigator.pop(Get.context!);
                    },
                    cancelText: AppString.permissionCancel,
                    yesText: AppString.permissionSetting,
                    content: AppString.photoPermissionDesc,
                    title: AppString.photoPermission,
                    yesFunction: () {
                      Navigator.pop(Get.context!);
                      openAppSettings();
                    },
                  );
                }
              }
              PreferenceStorage.setFirstPermissionPhoto(true);
            },
          )
        ],
      );
    },
  );
}

Future<bool> requestCameraPermission() async {
  final camPermission = await Permission.camera.status;
  Completer<bool> result = Completer();
  if (camPermission.isGranted) {
    result.complete(true);
  } else {
    if (PreferenceStorage.getFirstPermissionCamera() == false) {
      await Permission.camera.request().then((value) async {
        if (value.isGranted) {
          result.complete(true);
        }
      });
    } else {
      showPermissionDialog(
        noFunction: () {
          Navigator.pop(Get.context!);
          result.complete(false);
        },
        cancelText: AppString.permissionCancel,
        yesText: AppString.permissionSetting,
        content: AppString.cameraPermissionDesc,
        title: AppString.cameraPermission,
        yesFunction: () {
          Navigator.pop(Get.context!);
          openAppSettings();
          result.complete(false);
        },
      );
    }
    PreferenceStorage.setFirstPermissionCamera(true);
  }
  return result.future;
}

Future<bool> requestImagePermission() async {
  int version = 21;
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    version = androidInfo.version.sdkInt;
  }
  if (Platform.isIOS || (Platform.isAndroid && version > 32)) {
    return true;
  }
  return false;
}

Future checkFileSaverPermission({
  required BuildContext context,
  required Function onChange,
}) async {
  final canUsePhotos = await Permission.photos.status;
  final canUseStorage = await Permission.storage.status;
  int version = 21;
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    version = androidInfo.version.sdkInt;
  }

  if (version > 32) {
    onChange(true);
  }

  if (Platform.isAndroid && version < 33) {
    if (canUseStorage.isGranted) {
      onChange(true);
    } else if (canUseStorage.isDenied ||
        canUseStorage.isPermanentlyDenied ||
        canUseStorage.isLimited) {
      if (PreferenceStorage.getFirstPermissionStorage() == false) {
        await Permission.storage.request().then((value) async {
          if (value.isGranted) {
            onChange(true);
          }
        });
      }
      if (PreferenceStorage.getFirstPermissionStorage()) {
        showPermissionDialog(
          noFunction: () {
            Navigator.pop(Get.context!);
          },
          cancelText: AppString.permissionCancel,
          yesText: AppString.permissionSetting,
          content: AppString.storagePermissionDesc,
          title: AppString.storagePermission,
          yesFunction: () {
            Navigator.pop(Get.context!);
            openAppSettings();
          },
        );
        onChange(false);
      }
    }
    PreferenceStorage.setFirstPermissionStorage(true);
  } else {
    if (canUsePhotos.isGranted) {
      onChange(true);
    } else if (canUsePhotos.isDenied ||
        canUsePhotos.isPermanentlyDenied ||
        canUsePhotos.isLimited) {
      if (PreferenceStorage.getFirstPermissionPhoto() == false) {
        await Permission.photos.request().then((value) async {
          if (value.isGranted) {
            onChange(true);
          }
        });
      }
      if (PreferenceStorage.getFirstPermissionPhoto()) {
        showPermissionDialog(
          noFunction: () {
            Navigator.pop(Get.context!);
          },
          cancelText: AppString.permissionCancel,
          yesText: AppString.permissionSetting,
          content: AppString.photoPermissionDesc,
          title: AppString.photoPermission,
          yesFunction: () {
            Navigator.pop(Get.context!);
            openAppSettings();
          },
        );

        onChange(false);
      }
    }
    PreferenceStorage.setFirstPermissionPhoto(true);
  }
}

Future getFileSaverPermission() async {
  final canUsePhotos = await Permission.photos.status;
  final canUseStorage = await Permission.storage.status;
  int version = 21;
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    version = androidInfo.version.sdkInt;
  }

  if (version > 32) {
    return true;
  }

  if (Platform.isAndroid && version < 33) {
    if (canUseStorage.isGranted) {
      return true;
    } else {
      return false;
    }
  } else {
    if (canUsePhotos.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}

// Future getCurrentLocation({
//   required BuildContext context,
//   required Function onSuccess,
//   bool? getLocation = false,
// }) async {
//   Location location = Location();

//   final canUseLocation = await Permission.location.status;
//   if (canUseLocation.isGranted) {
//     logger.d(canUseLocation.isGranted);

//     if (await location.serviceEnabled()) {
//       onSuccess();
//       location.getLocation().then((value) {
//         // onSuccess(value.latitude ?? 0.0, value.longitude ?? 0.0)
//         PreferenceStorage.setCurrentLatitude(value.latitude.toString());
//         PreferenceStorage.setCurrentLongitude(value.longitude.toString());
//       });
//     } else {
//       location.requestService().then((value) {
//         if (value) {
//           onSuccess();
//           location.getLocation().then((value) {
//             PreferenceStorage.setCurrentLatitude(value.latitude.toString());
//             PreferenceStorage.setCurrentLongitude(value.longitude.toString());
//           });
//         }
//       });
//     }
//     logger.d(canUseLocation.isGranted);
//   } else if (canUseLocation.isDenied ||
//       canUseLocation.isPermanentlyDenied ||
//       canUseLocation.isLimited) {
//     if (PreferenceStorage.getFirstPermissionLocation() == false) {
//       await Permission.location.request().then((value) async {
//         if (value.isGranted) {
//           if (await location.serviceEnabled()) {
//             onSuccess();
//             location.getLocation().then((value) {
//               PreferenceStorage.setCurrentLatitude(value.latitude.toString());
//               PreferenceStorage.setCurrentLongitude(value.longitude.toString());
//             });
//           } else {
//             location.requestService().then((value) {
//               if (value) {
//                 onSuccess();
//                 location.getLocation().then((value) {
//                   PreferenceStorage.setCurrentLatitude(value.latitude.toString());
//                   PreferenceStorage.setCurrentLongitude(
//                       value.longitude.toString());
//                 });
//               }
//             });
//           }
//         }
//       });
//     }
//     if (PreferenceStorage.getFirstPermissionLocation()) {
//       showPermissionDialog(
//         noFunction: () {
//           Navigator.pop(GlobalVariable.navigatorKey.currentContext!);
//         },
//         cancelText: AppString.permissionCancel,
//         yesText: AppString.permissionSetting,
//         content: AppString.locationPermissionDesc,
//         title: AppString.locationPermission,
//         yesFunction: () {
//           Navigator.pop(GlobalVariable.navigatorKey.currentContext!);
//           openAppSettings();
//         },
//       );
//     }
//   }
//   PreferenceStorage.setFirstPermissionLocation(true);
// }

Future textInputDialog({
  required Function updateOnPress,
  required String title,
  required String submitText,
}) {
  TextEditingController outputVal = TextEditingController();
  return showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.commonPaddingForScreen),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.r4))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomTextWidget.medium14(
                text: AppString.cancel,
                color: ColorConst.primaryColor,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                updateOnPress(outputVal.text);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextWidget.medium14(
                  text: submitText,
                  color: ColorConst.primaryColor,
                ),
              ),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Dimensions.h20,
              ),
              Row(
                children: [CustomTextWidget.semiBold15(text: title)],
              ),
              SizedBox(
                height: Dimensions.h15,
              ),
              TextField(
                controller: outputVal,
                keyboardType: TextInputType.text,
                style: fontStyleMedium16,
                onChanged: (v) {
                  logger.w(v);
                },
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorConst.primaryColor),
                    ),
                    hintText: 'Enter description...',
                    hintStyle:
                        fontStyleRegular16.apply(color: ColorConst.hintColor)),
              ),
              SizedBox(
                height: Dimensions.h15,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future showCupertinoActionDialog(
    {BuildContext? context,
    String? title,
    String? content,
    String? cancelText,
    Function? noFunction,
    String? yesText,
    Function? yesFunction}) {
  return showCupertinoDialog(
    context: context!,
    builder: (context) => Theme(
      data: ThemeData.light(),
      child: CupertinoAlertDialog(
        title: Text(title!,
            style: fontStyleSemiBold17.apply(fontFamily: FontAsset.sfPro)),
        content: Text(content!,
            style: fontStyleRegular13.apply(fontFamily: FontAsset.sfPro)),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              yesFunction!();
            },
            child: Text(yesText!,
                style: fontStyleMedium17.apply(
                    color: ColorConst.dialogRedColor,
                    fontFamily: FontAsset.sfPro)),
          ),
          CupertinoDialogAction(
            onPressed: () {
              noFunction!();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(cancelText!,
                  style: fontStyleMedium17.apply(
                      color: ColorConst.blueColor,
                      fontFamily: FontAsset.sfPro)),
            ),
          ),
        ],
      ),
    ),
  );
}
