import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicornect/app/helper/helper.dart';
import 'package:unicornect/app/providers/scroll_message_provider.dart';
import 'package:unicornect/app/screens/sign_in_screen.dart';
import 'package:unicornect/app/screens/tweak.dart';


enum Tweak{
  following,
  personal,
  language,
  contact,
  text,
  faq,
  privacy,
  terms
}


class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? pickedImage;
  bool darkMode = false;
  bool showNotifications = false;

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final imageXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imageXFile == null) return;
    setState(() {
      pickedImage = File(imageXFile.path);
    });
  }

  late ScrollController _controller;

  void onScroll() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      ref.read(scrollMessageProvider.notifier).updateMessenger(true);
      return;
    }
    ref.read(scrollMessageProvider.notifier).updateMessenger(false);
  }


  void _tweakNavigation(Tweak tweak) {
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TweakScreen(tweak: tweak),
        )
    );
  }

  void _logoutHandler(){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const SignInScreen();
                  },
                )
              );
              ref.read(scrollMessageProvider.notifier).updateMessenger(false);
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                fontWeight: FontWeight.w600
              ),
            )
          ),
          const SizedBox(width: 15,),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              )
          )
        ],
        title: const Column(
          children: [
            Text(
              'Are you sure?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Do you want to logout?',
              style: TextStyle(
                  fontSize: 16,
              ),
            ),
          ],
        ),
        icon: Icon(
          Icons.warning_rounded,
          color: Helper.hexToColor('#FF6347'),
          size: 30,
        ),
      ),
    );
    // ref.read(scrollMessageProvider.notifier).updateMessenger(false);
  }


  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controller.addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
            controller: _controller,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 39.5,
                            backgroundColor: Colors.white60,
                            foregroundImage: pickedImage == null
                                ? const AssetImage(
                                'assets/images/profile_image.png')
                                : FileImage(pickedImage!),
                          ),
                          Positioned(
                              bottom: -17,
                              right: -8,
                              child: IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white
                                  ),
                                  onPressed: _pickImage,
                                  icon: const Icon(Icons.camera_alt_outlined,
                                    color: Colors.black,)
                              )
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {

                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 38,
                          width: 38,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 0)
                                )
                              ]
                          ),
                          child: const Icon(Icons.bookmark , color: Colors.black,),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('The Concealer',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _tweakNavigation(Tweak.following);
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Following 3',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  const Text('Michael Ndubuisi John',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const Text('mndubuisi1000@gmail.com',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    width: 179,
                    height: 42,
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                        color: Helper.hexToColor('#D9D9D9'),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Helper.hexToColor('#545456'),
                        ),
                        const SizedBox(width: 4,),
                        Text('Bells University',
                          style: TextStyle(
                              fontSize: 16,
                              color: Helper.hexToColor('#242426')
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    leading: Image.asset(
                      'assets/images/details_icon.png',
                      height: 24,
                    ),
                    title: const Text('Personal Details',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    // height: 116,
                    decoration: BoxDecoration(
                        color: Helper.hexToColor('#F6F0E9'),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('Personal Information'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.personal);
                          },
                        ),
                        ListTile(
                          title: const Text('Location Settings'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35,),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    leading: Image.asset(
                      'assets/images/settings_icon.png',
                      height: 24,
                    ),
                    title: const Text('General Settings',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    // height: 116,
                    decoration: BoxDecoration(
                        color: Helper.hexToColor('#F6F0E9'),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('Language'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.language);
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('Text Size'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.text);
                          },
                        ),
                        SwitchListTile(
                          value: darkMode,
                          trackColor: const WidgetStatePropertyAll(
                              Colors.black),
                          onChanged: (value) {
                            setState(() {
                              darkMode = value;
                            });
                          },
                          title: const Text('Dark Mode'),
                        ),
                        SwitchListTile(
                          value: showNotifications,
                          trackColor: const WidgetStatePropertyAll(
                              Colors.black),
                          onChanged: (value) {
                            setState(() {
                              showNotifications = value;
                            });
                          },
                          title: const Text('Notifications'),
                          subtitle: const Text('Turn on push notifications'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 35,),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    leading: Image.asset(
                      'assets/images/support_icon.png',
                      height: 24,
                    ),
                    title: const Text('Help & Support',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    // height: 116,
                    decoration: BoxDecoration(
                        color: Helper.hexToColor('#F6F0E9'),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('Contact Support'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.contact);
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('FAQ’s'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.faq);
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('Privacy Policy'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.privacy);
                          },
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: const Text('Terms & Conditions'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            _tweakNavigation(Tweak.terms);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Helper.hexToColor('#F6F0E9'),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: ListTile(
                        leading: Image.asset('assets/images/logout_icon.png', width: 24,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        onTap: _logoutHandler,
                        title: Text('Logout',
                          style: TextStyle(
                              color: Helper.hexToColor('#FF6347')
                          ),
                        )
                      )
                  ),
                  if(deviceHeight >= 1000)
                    const SizedBox(height: 90,)
                ]
            )
        )
    );
  }
}
