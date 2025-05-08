import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/presentation/chat/widgets/chat_list_widget.dart';
import 'package:trademate_app/theme/palette.dart';
import 'package:trademate_app/widgets/rounded_searchbar_widget.dart';

class ChatMainView extends StatefulWidget {
  const ChatMainView({super.key});

  @override
  State<ChatMainView> createState() => _ChatMainViewState();
}

class _ChatMainViewState extends State<ChatMainView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy list of recent chats
  final List<Map<String, String>> _recentChats = [
    {"name": "Alice", "lastMessage": "Hey, how are you?", "time": "10:30 AM"},
    {"name": "Bob", "lastMessage": "Meeting at 2 PM?", "time": "Yesterday"},
    {"name": "Charlie", "lastMessage": "Sent a photo", "time": "Sunday"},
    {"name": "David", "lastMessage": "Okay, thanks!", "time": "Saturday"},
    {"name": "Eve", "lastMessage": "See you soon!", "time": "Friday"},
    {
      "name": "Frank",
      "lastMessage": "Did you get the file?",
      "time": "11/04/24"
    },
    {"name": "Grace", "lastMessage": "Let's catch up.", "time": "10/04/24"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        initialIndex: 1,
        vsync: this); // Chats tab is usually the second tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Use SafeArea to avoid status bar overlap
        child: Column(
          children: <Widget>[
            // Custom Header for Home Page
            Container(
              color: Palette.primaryDef,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "TradeMate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              child: Icon(
                                TablerIcons.dots_vertical,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            RoundedSearchBar(
              hintText: "Search in chats...",
              onChanged: (text) {
                // Do something when the text changes, e.g., filter a list
                print("Search text: $text");
              },
            ),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  // Camera Tab (Placeholder)
                  const Center(child: Text("Camera View Placeholder")),
                  // Chats Tab
                  ListView.builder(
                    itemCount: _recentChats.length,
                    itemBuilder: (context, index) {
                      final chat = _recentChats[index];
                      return ChatListItem(
                        name: chat["name"]!,
                        lastMessage: chat["lastMessage"]!,
                        time: chat["time"]!,
                      );
                    },
                  ),
                ],
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
