import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateAccountButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Netflix red color
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Button height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        child: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0, // Button text size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}
