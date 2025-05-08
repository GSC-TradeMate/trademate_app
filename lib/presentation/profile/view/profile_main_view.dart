import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/presentation/profile/widgets/profile_list_widget.dart';
import 'package:trademate_app/theme/palette.dart';

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
            // Custom Header for Profile Page
            Container(
              color: Palette.primaryDef,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Profile", // Page title
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Add more icons here if needed
                ],
              ),
            ),

            // Profile Content Area
            Expanded(
              // Use Expanded to make the content area take available space
              child: SingleChildScrollView(
                // Use SingleChildScrollView for potential scrolling
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 24.0), // Spacing from the header

                    const CircleAvatar(
                      radius: 60,
                      backgroundColor:
                          Palette.primaryBgWeak, // Placeholder background
                      //backgroundImage: NetworkImage('URL_TO_YOUR_PROFILE_IMAGE'), // Use NetworkImage for online images
                      child: Icon(
                        TablerIcons.user, // Placeholder icon
                        size: 60,
                        color: Palette.primaryDef,
                      ),
                    ),
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
                      text: "Profile Edit",
                    ),
                    ProfileListWidget(
                      icon: TablerIcons.crown,
                      text: "Subscription",
                    ),
                    ProfileListWidget(
                      icon: TablerIcons.settings,
                      text: "Settings",
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
