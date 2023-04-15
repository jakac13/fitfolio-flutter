import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:closet_assist/services/storage_service.dart';
import 'package:closet_assist/pages/account_page.dart';
import 'package:closet_assist/provider/item_color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:closet_assist/provider/image_dowload_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:cyclop/cyclop.dart';

//*Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

//*Pages
import 'package:closet_assist/pages/register_page.dart';
import 'package:closet_assist/pages/account_page.dart';

import 'package:google_fonts/google_fonts.dart';

//*Widgets
import 'package:closet_assist/widgets/my_drawer.dart';
import 'package:closet_assist/widgets/my_drawer_list.dart';
import 'package:closet_assist/widgets/buttons/primary_btn_dialog.dart';
import 'package:closet_assist/widgets/buttons/secondary_btn_dialog.dart';
import 'package:closet_assist/widgets/add_item/add_item_texform_field.dart';
import 'package:closet_assist/widgets/add_item/add_item_dropdown_btn.dart';

//*Classes
import 'package:closet_assist/models/item.dart';

//*FilePicker
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/image_path_provider.dart';

import 'package:dotted_border/dotted_border.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class ChooseImageWidgetNew extends StatefulWidget {
  const ChooseImageWidgetNew({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseImageWidgetNew> createState() => _ChooseImageWidgetNewState();
}

class _ChooseImageWidgetNewState extends State<ChooseImageWidgetNew> {
  String? downloadUrl;
  File? image;
  bool _isLoading = false;
  bool _imageDownloaded = false;
  Color selectedColor = Colors.transparent;
  GlobalKey key = GlobalKey();
  bool _imageSelected = false;

  void openFiles(BuildContext context) async {
    try {
      final resultFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 720,
        maxWidth: 1280,
        imageQuality: 90,
      );
      if (resultFile != null) {
        final fileName = resultFile.name;
        final imageTemp = File(resultFile.path);
        setState(() {
          _isLoading = true;
          _imageDownloaded = false;
          _imageSelected = true;
          this.image = imageTemp;
          final imagePathProvider =
              Provider.of<ImagePathProvider>(context, listen: false);
          imagePathProvider.imagePath = resultFile.path;
          imagePathProvider.imageName = resultFile.name;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No file selected"),
          ),
        );
        return null;
      }
    } on PlatformException catch (e) {
      print("Failed to pick image");
    }
    final path = image!.path;

    setState(() {
      _isLoading = false;
      _imageDownloaded = true;
      _imageSelected = false;
    });
  }

  Future openCamera(ImageSource source) async {
    try {
      final resultFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 55,
      );
      if (resultFile != null) {
        final fileName = resultFile.name;
        final imageTemp = File(resultFile.path);
        setState(() {
          _isLoading = true;
          _imageDownloaded = false;
          _imageSelected = true;
          this.image = imageTemp;
          final imagePathProvider =
              Provider.of<ImagePathProvider>(context, listen: false);
          imagePathProvider.imagePath = resultFile.path;
          imagePathProvider.imageName = resultFile.name;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No file selected"),
          ),
        );
        return null;
      }
    } on PlatformException catch (e) {
      /* print("Failed to pick image"); */
    }
    final path = image!.path;

    setState(() {
      _isLoading = false;
      _imageDownloaded = true;
      _imageSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Expanded(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      onTap: () => openFiles(context),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: const [
                            Expanded(
                              child: Icon(
                                Icons.photo_library,
                                color: color.textPrimary,
                                size: 22,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Expanded(child: Text("Gallery"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(40)),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      onTap: () => openCamera(ImageSource.camera),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: const [
                            Expanded(
                              child: Icon(
                                Icons.add_a_photo,
                                color: color.textPrimary,
                                size: 22,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Expanded(child: Text("Camera"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40))),
                    child: EyedropperButton(
                        iconColor: color.textPrimary,
                        icon: Icons.colorize,
                        onColor: (value) {
                          setState(() {
                            selectedColor = value;
                            Provider.of<ItemColorProvider>(context,
                                    listen: false)
                                .color = selectedColor;
                          });
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    dashPattern: const [5, 5],
                    color: color.textSecondary.withOpacity(0.2),
                    strokeWidth: 0.5,
                    borderPadding: const EdgeInsets.all(0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 300,
                                  child: image != null
                                      ? Image.file(
                                          image!,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          "images/logonobg.png",
                                          height: 100,
                                        ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: selectedColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
