import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RoundedSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const RoundedSearchBar({
    Key? key,
    this.hintText = 'Search...', // Default hint text
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 16.0), // Add some margin
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the search bar
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon:
              Icon(TablerIcons.search, color: Colors.grey[600]), // Search icon
          border: InputBorder.none, // Remove the default border
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 14.0), // Adjust padding
        ),
      ),
    );
  }
}
