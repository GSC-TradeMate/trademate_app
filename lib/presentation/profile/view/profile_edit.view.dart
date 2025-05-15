import 'package:flutter/material.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/widgets/button_solid_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Palette.primaryDef),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Palette.primaryDef,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        // Use SafeArea to avoid status bar overlap
        child: Column(
          children: <Widget>[
            // Profile Edit Content Area
            Expanded(
              // Use Expanded to make the content area take available space
              child: SingleChildScrollView(
                // Use SingleChildScrollView for potential scrolling
                padding: const EdgeInsets.all(
                    16.0), // Add padding around the content
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center items horizontally
                  children: <Widget>[
                    const SizedBox(height: 16.0), // Spacing from the header

                    // Name TextField
                    _buildRoundedTextField(
                      label: "Name",
                      initialValue: "", // Dummy data from image
                    ),
                    const SizedBox(height: 16.0),

                    // About TextField
                    _buildRoundedTextField(
                      label: "About",
                      initialValue: "", // Dummy data from image
                      maxLines: 5, // Allow multiple lines for About
                    ),
                    const SizedBox(height: 16.0),

                    // Mobile number TextField
                    _buildRoundedTextField(
                      label: "Mobile number",
                      initialValue: "", // Dummy data from image
                      keyboardType:
                          TextInputType.phone, // Set keyboard type to phone
                    ),
                    const SizedBox(height: 16.0),

                    // Alamat TextField
                    _buildRoundedTextField(
                      label: "Alamat",
                      initialValue: "", // Dummy data from image
                      maxLines: 4, // Allow multiple lines for Address
                    ),
                    const SizedBox(height: 16.0),

                    // Add more fields as needed
                    ButtonSolid(
                      child: Text("Save"),
                      bgColor: Palette.primaryDef,
                      fixedSize: Size(MediaQuery.of(context).size.width, 20),
                      onPressed: () {},
                      radius: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build a rounded TextField container
  Widget _buildRoundedTextField({
    required String label,
    String initialValue = "",
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 8.0), // Adjust padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                color: Palette.grey, // Lighter color for label
              ),
            ),
            TextField(
              controller: TextEditingController(
                  text: initialValue), // Set initial value
              maxLines: maxLines,
              keyboardType: keyboardType,
              decoration: const InputDecoration(
                border: InputBorder.none, // Remove default border
                contentPadding: EdgeInsets.zero, // Remove default padding
                isDense: true, // Reduce vertical space
              ),
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87), // Text style for input
            ),
          ],
        ),
      ),
    );
  }
}
