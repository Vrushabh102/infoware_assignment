import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infoware_flutter_assignment/common/widgets/custom_button.dart';
import 'package:infoware_flutter_assignment/features/form/ui/widgets/text_input_widget.dart';
import 'package:infoware_flutter_assignment/features/products/ui/products_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Enter Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // name form field
              Row(
                children: [
                  const Icon(Icons.location_history),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.grey,
                      controller: _nameController,
                      decoration: textInputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (value.length < 3) {
                          return 'Name must be at least 3 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.012),

              // email form field
              Row(
                children: [
                  const Icon(Icons.mail_rounded),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.grey,
                      controller: _emailController,
                      decoration: textInputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.012),

              // phone form field
              Row(
                children: [
                  const Icon(Icons.phone),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.grey,
                      controller: _phoneController,
                      decoration: textInputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10 || value.length > 13) {
                          return 'Phone number must be between 10 and 13 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.012),

              // gender form field
              Row(
                children: [
                  const Icon(Icons.person),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                      value: _selectedGender,
                      decoration: textInputDecoration(labelText: 'Gender'),
                      items: ['Male', 'Female', 'Other'].map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGender = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your gender';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.012),

              // country form field
              Row(
                children: [
                  const Icon(Icons.flag),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.grey,
                      controller: _countryController,
                      decoration: textInputDecoration(labelText: 'Country'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your country';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.012),

              // state form field
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.grey,
                      controller: _stateController,
                      decoration: textInputDecoration(labelText: 'State'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your state';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.012),

              // city form field
              Row(
                children: [
                  const Icon(Icons.location_city),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.8,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.grey,
                      controller: _cityController,
                      decoration: textInputDecoration(labelText: 'City'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),

              CreateAccountButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form data is valid, proceed with further actions

                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductsScreen(),
                          ),
                          (route) {
                            return false;
                          },
                        );
                      },
                    );
                  } else {
                    // Form data is invalid, show errors
                    log('Validation failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
