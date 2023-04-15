import 'dart:developer';
import 'package:closet_assist/pages/outfits_page.dart';
import 'package:closet_assist/services/items_add.dart';
import 'package:closet_assist/pages/account_page.dart';
import 'package:closet_assist/pages/home_page.dart';
import 'package:closet_assist/widgets/items_display.dart';
import 'package:closet_assist/provider/search_query_provider.dart';
import 'package:closet_assist/provider/category_dropdown_btn_provider.dart';
import 'package:closet_assist/provider/image_path_provider.dart';
import 'package:closet_assist/provider/item_color_provider.dart';
import 'package:closet_assist/widgets/buttons/add_item_dropdown_btn_type.dart';
import 'package:closet_assist/widgets/buttons/primary_btn_dialog_icon.dart';

import 'package:closet_assist/widgets/add_item/choose_image_new.dart';
import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:closet_assist/provider/image_dowload_provider.dart';

//*Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

//*Pages
import 'package:closet_assist/pages/register_page.dart';
import 'package:closet_assist/pages/account_page.dart';

import 'package:google_fonts/google_fonts.dart';

//*Widgets
import 'package:closet_assist/widgets/buttons/primary_btn_dialog.dart';
import 'package:closet_assist/widgets/buttons/secondary_btn_dialog.dart';
import 'package:closet_assist/widgets/add_item/add_item_texform_field.dart';
import 'package:closet_assist/widgets/add_item/add_item_dropdown_btn.dart';

//*Classes
import 'package:closet_assist/models/item.dart';

//*FilePicker
import 'package:file_picker/file_picker.dart';
import 'package:string_to_color/string_to_color.dart';

import '../models/categories.dart';
import '../services/storage_service.dart';

//*Colors
import 'package:closet_assist/constants/colors.dart' as color;

class MainFramework extends StatefulWidget {
  const MainFramework({super.key});

  @override
  State<MainFramework> createState() => MainFrameworkState();
}

class MainFrameworkState extends State<MainFramework> {
  List pages = const [
    HomePage(),
    OutfitsPage(),
  ];

  bool isSaved = false;
  bool isUploading = false;
  bool isDragEnabled = false;

  int currentIndex = 0;
  void onTap(int index) {
    Provider.of<SearchQueryProvider>(context, listen: false).resetSearchQuery();
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var userFullName = user.displayName!.split(" ");
    var userName = userFullName[0];

    return Listener(
      //*Zagotovi, da se tipkovnica zapre, ko začnemo scrollat ali ko tapnemo stran.
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: pages[currentIndex],
          //* Visiblity Widget lahko določiš, kdaj nekaj zgine... Če smo na strani 0 je visible, drugače zgine.
          floatingActionButton: Visibility(
            visible: currentIndex == 0,
            child: FloatingActionButton.extended(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              /* Lahko dodaš .extended to FloatingActionButton */
              label: const Text(
                "Add New",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onPressed: () => _showModalBottomSheet(context),
              /* _dialogBuilder(context) */

              backgroundColor: color.textPrimary,
              foregroundColor: color.textButton,
              /* icon: const Icon(Icons.add), */
              tooltip: "Add a new item in your closet.",
              icon: const Icon(Icons.add),
              enableFeedback: true,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
              enableFeedback: true,
              onTap: onTap,
              currentIndex: currentIndex,
              showUnselectedLabels: false,
              elevation: 4,
              selectedItemColor: color.textPrimary,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                  tooltip: "Your stored items.",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons
                      .checkroom) /* CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ) */
                  ,
                  label: "Outfits",
                  tooltip: "Your collection of outfits.",
                )
                //auto_awesome_mosaic
                //dashboard
              ])),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final imageProvider =
        Provider.of<ImageDownloadProvider>(context, listen: false);
    //! V te spremenljivke iz Form Widgeta shranjujemo ime, kategorijo in sliko Item-a.
    String itemName = "";
    Category? itemCategory;
    Subcategory? itemType;
    String itemImagePath = "";

    final categoryDropdownBtnProvider =
        Provider.of<CategoryDropdownBtnProvider>(context, listen: false);
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 20, left: 15, right: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.add_box,
                                size: 30,
                                color: color.textPrimary,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add Item',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: color.textPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                            key: formKey,
                            child: Container(
                              child: Column(
                                children: [
                                  isUploading == true
                                      ? const CircularProgressIndicator()
                                      : const ChooseImageWidgetNew(),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  AddItemTextFormField(
                                    enabled: isUploading ? false : true,
                                    labelText: "Name",
                                    icon: Icons.label_important_rounded,
                                    stringValueSetter: (value) =>
                                        itemName = value,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AddItemDropdownButton(
                                      disabled: isUploading ? true : false,
                                      stringValueSetter: (value) {
                                        itemCategory = value;
                                        categoryDropdownBtnProvider
                                            .categorySelected = itemCategory;
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AddItemDropdownTypeButton(
                                      disabled: isUploading ? true : false,
                                      stringValueSetter: (value) =>
                                          itemType = value),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              children: [
                                SecondaryButtonDialog(
                                  buttonText: "Cancel",
                                  onPressedFunction: () {
                                    if (!isUploading) {
                                      // <-- only pop if not uploading
                                      Navigator.of(context).pop(
                                          false); // <-- pass false as a value
                                    }
                                  },
                                ),
                                const SizedBox(width: 10),
                                PrimaryBtnDialogIcon(
                                  icon: Icons.add,
                                  buttonText: "Add Item",
                                  bgColor: color.textPrimary,
                                  onPressedFunction: isUploading
                                      ? () {}
                                      : () async {
                                          if (formKey.currentState
                                                  ?.validate() ==
                                              true) {
                                            setState(() {
                                              //* To je zaradi tega, da gumbi postanejo disabled in da ne moreš še enkrat odpret image picker, kamero...
                                              isUploading = true;
                                            });
                                            Color? itemColor =
                                                Provider.of<ItemColorProvider>(
                                                        context,
                                                        listen: false)
                                                    .color;
                                            final imagePathProvider =
                                                Provider.of<ImagePathProvider>(
                                                    context,
                                                    listen: false);
                                            final imagePath =
                                                imagePathProvider.imagePath;
                                            final imageName =
                                                imagePathProvider.imageName;

                                            final Storage storage = Storage();

                                            final downloadURL =
                                                await storage.uploadFile(
                                                    imagePath, imageName);
                                            final userUID = user.uid;
                                            final newItem = Item.nouid(
                                                itemName,
                                                itemCategory?.name ?? "",
                                                itemType?.name ?? "",
                                                downloadURL.toString(),
                                                itemColor,
                                                DateTime.now());

                                            final timeUploaded = newItem
                                                .timestamp
                                                .toIso8601String()
                                                .substring(0, 19);

                                            ItemsAdd addItem = ItemsAdd();
                                            addItem
                                                .addItemToDB(
                                                    newItem.name,
                                                    newItem.category,
                                                    newItem.subcategory,
                                                    newItem.image,
                                                    newItem.color.toString(),
                                                    timeUploaded)
                                                .then((value) {
                                              setState(() {
                                                isUploading = false;
                                              });
                                              Navigator.of(context).pop(true);
                                            });
                                          }
                                        },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                          /* if (isUploading)
                          SnackBar(content: Text("We're adding your item.")) */
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      // <-- use then to show the widget after the modal sheet is closed
      if (value == true) {
        // <-- show the widget only if value is true
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: color.textButton,
            dismissDirection: DismissDirection.down,
            showCloseIcon: true,
            closeIconColor: color.textPrimary,
            elevation: 5,
            content: Text(
              'Item added successfully!',
              style: TextStyle(color: color.textPrimary),
            ),
          ),
        );
      }
    });
  }
}
