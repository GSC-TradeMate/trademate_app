import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/theme/palette.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundColor:
          Palette.primaryBgWeak, // Placeholder background
      //backgroundImage: NetworkImage('URL_TO_YOUR_PROFILE_IMAGE'), // Use NetworkImage for online images
      child: Icon(
        TablerIcons.user, // Placeholder icon
        size: 60,
        color: Palette.primaryDef,
      ),
    );
  }
}