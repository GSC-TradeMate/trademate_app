import 'package:flutter/material.dart';

import '../../../theme/palette.dart';

class ProfileListWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  const ProfileListWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 16.0, vertical: 8.0), // Add margin
        padding: const EdgeInsets.all(16.0), // Add padding inside the container
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Palette.primaryDef),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
