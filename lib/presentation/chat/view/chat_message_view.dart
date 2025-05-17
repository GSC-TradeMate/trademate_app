import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trademate_app/presentation/chat/controller/chat_message_controller.dart';
import 'package:trademate_app/presentation/chat/param/chat_message_param.dart';
import 'package:trademate_app/theme/palette.dart';

class ChatMessageView extends StatefulWidget {
  const ChatMessageView({super.key});

  @override
  State<ChatMessageView> createState() => _ChatMessageViewState();
}

class _ChatMessageViewState extends State<ChatMessageView> {
  final ChatMessageController _con = Get.find();
  ChatMessageParam param = Get.arguments;

  @override
  void initState() {
    super.initState();
    _con.init(param);
  }

  @override
  void dispose() {
    _con.disp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Chat background color
      body: SafeArea(
        // Use SafeArea to avoid status bar overlap
        child: Column(
          children: <Widget>[
            // Custom Header
            _buildHeader(context),

            // Chat Messages Area
            Obx(
              () => Flexible(
                child: SmartRefresher(
                  controller: _con.refreshController,
                  onLoading: _con.onLoadMore,
                  enablePullUp: true,
                  enablePullDown: false,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: true, // To show latest messages at the bottom
                    itemCount: _con.messages.length,
                    itemBuilder: (_, int i) {
                      // Replace with actual message bubble widgets
                      return ListTile(
                        title: Align(
                          alignment: _con.messages[i].fromMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: _con.messages[i].fromMe
                                  ? Palette.primaryDef
                                  : Palette.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              _con.messages[i].content ??
                                  "<< ${_con.messages[i].type.name} >>",
                              style: TextStyle(
                                color: _con.messages[i].fromMe
                                    ? Palette.white
                                    : Palette.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Message Input Area
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Palette.primaryDef),
            onPressed: () {
              // Handle back button press
              Navigator.pop(
                  context); // Navigate back to the previous screen (HomePage)
            },
          ),
          const CircleAvatar(
            backgroundColor: Palette.primaryBgWeak,
            child: Icon(TablerIcons.user, color: Palette.primaryDef),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            // Use Expanded here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  param.name,
                  style: const TextStyle(
                    color: Palette.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                // const Text(
                //   "online", // Replace with actual status
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 98, 98, 98),
                //     fontSize: 12.0,
                //   ),
                // ),
              ],
            ),
          ),
          Obx(() => Visibility(
                visible: _con.isMessageLoad,
                child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Palette.primaryDef,
                    strokeWidth: 2,
                  ),
                ),
              )),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Palette.primaryDef),
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                // controller: _textController,
                // onSubmitted: _handleSubmitted,
                style: const TextStyle(color: Palette.black),
                decoration: const InputDecoration(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Palette.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(TablerIcons.send_2, color: Palette.primaryDef),
              onPressed: () {
                // Handle send button press
                // _handleSubmitted(_textController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
