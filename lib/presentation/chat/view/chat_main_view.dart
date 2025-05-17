import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trademate_app/presentation/chat/controller/chat_main_controller.dart';
import 'package:trademate_app/presentation/chat/widgets/chat_list_widget.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/utils/date_formatter.dart';
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
          Obx(
            () => Visibility(
              visible: _con.isChatFetchedError,
              child: IconButton(
                icon: Icon(
                  TablerIcons.refresh,
                  color: Palette.primaryDef,
                ),
                onPressed: _con.onRefresh,
              ),
            ),
          ),
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
                    SmartRefresher(
                  controller: _con.refreshController,
                  onRefresh: _con.onRefresh,
                  child: ListView.builder(
                    itemCount: _con.chatLists.length,
                    itemBuilder: (context, index) {
                      return ChatListItem(
                        name: _con.chatLists[index].name,
                        lastMessage: _con.chatLists[index].body ?? "-",
                        time: DateFormatter.formatDynamic(
                            _con.chatLists[index].createdAt),
                        onTap: () => _con.handleMoveToMessage(
                          name: _con.chatLists[index].name,
                          id: _con.chatLists[index].id,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
