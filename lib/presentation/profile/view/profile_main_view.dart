import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/profile/widgets/profile_avatar_widget.dart';
import 'package:trademate_app/presentation/profile/widgets/profile_list_widget.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class ProfileMainView extends StatefulWidget {
  const ProfileMainView({super.key});

  @override
  State<ProfileMainView> createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<ProfileMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or a light background color
      body: SafeArea(
        // Use SafeArea to avoid status bar overlap
        child: Column(
          children: <Widget>[
            // Profile Content Area
            Expanded(
              // Use Expanded to make the content area take available space
              child: SingleChildScrollView(
                // Use SingleChildScrollView for potential scrolling
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40.0),
                    Text(
                      "Profile", // Page title
                      style: TextStyle(
                        color: Palette.primaryDef,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0), // Spacing from the header

                    ProfileAvatarWidget(),
                    const SizedBox(height: 16.0),

                    const Text(
                      "Your Name", // Replace with actual user name
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),

                    ProfileListWidget(
                      icon: TablerIcons.pencil,
                      text: "Edit Profile",
                      onTap: () {
                        Get.toNamed(AppRoute.editProfile);
                      },
                    ),
                    ProfileListWidget(
                      icon: TablerIcons.crown,
                      text: "Subscription",
                      onTap: () {},
                    ),
                    ProfileListWidget(
                      icon: TablerIcons.settings,
                      text: "Settings",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
