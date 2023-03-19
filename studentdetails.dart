import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helloworld/dashboard.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _image;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    var _cgpaController;
    var _dateofbirthController;
    var _registerController;

    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _cgpaController;
    var _dateofbirthController;
    var _registerController;
    return Scaffold(
        backgroundColor: Color(0xff1f566d),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('User Profile'),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            leading:
                                                const Icon(Icons.camera_alt),
                                            title: const Text('Take a photo'),
                                            onTap: () {
                                              _pickImage(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading:
                                                const Icon(Icons.photo_library),
                                            title: const Text(
                                                'Choose from gallery'),
                                            onTap: () {
                                              _pickImage(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey[200],
                                backgroundImage:
                                    _image != null ? FileImage(_image!) : null,
                                child: _image == null
                                    ? const Icon(
                                        Icons.camera_alt,
                                        size: 50,
                                        color: Colors.grey,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors
                                    .white, // Set the label text color to red
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _registerController,
                            decoration: const InputDecoration(
                              labelText: 'Register Number',
                              labelStyle: TextStyle(
                                color: Colors
                                    .white, // Set the label text color to red
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your register number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                              labelStyle: TextStyle(
                                color: Colors
                                    .white, // Set the label text color to red
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _cgpaController,
                            decoration: const InputDecoration(
                              labelText: 'Cgpa',
                              labelStyle: TextStyle(
                                color: Colors
                                    .white, // Set the label text color to red
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter cgpa';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _dateofbirthController,
                            decoration: const InputDecoration(
                              labelText: 'DOB',
                              labelStyle: TextStyle(
                                color: Colors
                                    .white, // Set the label text color to red
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter DOB';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(height: 100),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 50),
                                  primary: Colors
                                      .black, // Set the background color to red
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()),
                                  );
                                },
                                child: const Text('Update'),
                              ),
                              const SizedBox(height: 100),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 50),
                                  primary: Colors
                                      .black, // Set the background color to red
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()),
                                  );
                                },
                                child: const Text('submit'),
                              ),
                            ],
                          ),
                        ])))));
  }
}
