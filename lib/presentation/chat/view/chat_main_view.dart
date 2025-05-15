import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trademate_app/presentation/chat/controller/chat_main_controller.dart';
import 'package:trademate_app/presentation/chat/widgets/chat_list_widget.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/widgets/rounded_searchbar_widget.dart';

class ChatMainView extends StatefulWidget {
  const ChatMainView({super.key});

  @override
  State<ChatMainView> createState() => _ChatMainViewState();
}

class _ChatMainViewState extends State<ChatMainView> {
  final ChatMainController _con = Get.find();

  @override
  void initState() {
    super.initState();
    _con.init();
  }

  @override
  void dispose() {
    _con.disp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 0,
        title: const Text(
          "TradeMate",
          style: TextStyle(
            color: Palette.primaryDef,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              TablerIcons.dots_vertical,
              color: Palette.primaryDef,
            ),
            onPressed: () {
              // Refresh action
            },
          ),
        ],
      ),
      body: SafeArea(
        // Use SafeArea to avoid status bar overlap
        child: Column(
          children: <Widget>[
            RoundedSearchBar(
              hintText: "Search in chats...",
              onChanged: (text) {
                // Do something when the text changes, e.g., filter a list
                print("Search text: $text");
              },
            ),

            // Tab Bar View
            Obx(
              () => Expanded(
                child:
                    // Chats Tab
                    ListView.builder(
                  itemCount: _con.chatLists.length,
                  itemBuilder: (context, index) {
                    return ChatListItem(
                      name: _con.chatLists[index].name,
                      lastMessage: _con.chatLists[index].body ?? "kosong",
                      time: _con.chatLists[index].createdAt.toIso8601String(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {},
        child: const Icon(
          TablerIcons.message_circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
