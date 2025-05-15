import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:trademate_app/presentation/profile/controller/profile_main_controller.dart';
import 'package:trademate_app/presentation/profile/widgets/profile_avatar_widget.dart';
import 'package:trademate_app/presentation/profile/widgets/profile_list_widget.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/utils/hive/hive_app.dart';
import 'package:trademate_app/utils/routes/app_routes.dart';

class ProfileMainView extends StatefulWidget {
  const ProfileMainView({super.key});

  @override
  State<ProfileMainView> createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<ProfileMainView> {
  final ProfileMainController _con = Get.find();

  @override
  void initState() {
    super.initState();
    _con.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40.0),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Palette.primaryDef,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ProfileAvatarWidget(),
                    const SizedBox(height: 16.0),
                    Obx(
                      () => Text(
                        _con.profileData?.name ?? "-",
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // ProfileListWidget(
                    //   icon: TablerIcons.pencil,
                    //   text: "Edit Profile",
                    //   onTap: () {
                    //     Get.toNamed(AppRoute.editProfile);
                    //   },
                    // ),
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
                    ProfileListWidget(
                      icon: TablerIcons.logout,
                      text: "Logout",
                      onTap: () {
                        HiveApp.clear();
                        Get.offAllNamed(AppRoute.authWelcome);
                      },
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
