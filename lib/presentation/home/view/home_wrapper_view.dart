import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:trademate_app/presentation/chat/view/chat_main_view.dart';
import 'package:trademate_app/presentation/insight/view/insight_main_view.dart';
import 'package:trademate_app/presentation/profile/view/profile_main_view.dart';
import 'package:trademate_app/test/test_main_view.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/utils/constant.dart';

class HomeWrapperView extends StatefulWidget {
  const HomeWrapperView({super.key});

  @override
  State<HomeWrapperView> createState() => _HomeWrapperViewState();
}

final PersistentTabController tabBarController =
    PersistentTabController(initialIndex: 0);

class _HomeWrapperViewState extends State<HomeWrapperView> {
  List<Widget> get _buildWidget {
    return [
      const ChatMainView(),
      const InsightMainView(),
      const ProfileMainView(),
      if (Constant.CURRENT_ENVIRONMENT == Environment.DEV) const TestMainView(),
    ];
  }

  List<PersistentBottomNavBarItem> get _buildItems {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          TablerIcons.message_circle,
          size: 28,
        ),
        activeColorPrimary: Palette.primaryDef,
        inactiveColorPrimary: Palette.grey,
        title: "Chat",
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Palette.grey,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          TablerIcons.arrow_elbow_right,
          size: 28,
        ),
        activeColorPrimary: Palette.primaryDef,
        inactiveColorPrimary: Palette.grey,
        title: "Insight",
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Palette.grey,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          TablerIcons.user,
          size: 28,
        ),
        activeColorPrimary: Palette.primaryDef,
        inactiveColorPrimary: Palette.grey,
        title: "Profile",
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Palette.grey,
        ),
      ),
      if (Constant.CURRENT_ENVIRONMENT == Environment.DEV)
        PersistentBottomNavBarItem(
          icon: const Icon(
            TablerIcons.test_pipe_2,
            size: 28,
          ),
          activeColorPrimary: Palette.primaryDef,
          inactiveColorPrimary: Palette.grey,
          title: "Test",
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Palette.grey,
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabBarController,
      screens: _buildWidget,
      items: _buildItems,
      navBarStyle: NavBarStyle.style12,
      padding: const EdgeInsets.symmetric(vertical: 8),
      navBarHeight: 72,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Palette.black,
          ),
        ],
      ),
      backgroundColor: Palette.white,
    );
  }
}
