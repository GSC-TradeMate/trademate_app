import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/theme/palette.dart';

class ChatScreen extends StatefulWidget {
  final String contactName; // Add contactName parameter

  const ChatScreen({Key? key, required this.contactName}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Dummy list of messages
  final List<String> _messages = [
    "Hi there!",
    "Hello!",
    "How are you?",
    "I'm good, thanks! How about you?",
    "Doing well too.",
  ];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(text);
    });
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
                controller: _textController,
                onSubmitted: _handleSubmitted,
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
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
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
            Container(
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
                    icon:
                        const Icon(Icons.arrow_back, color: Palette.primaryDef),
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
                          widget.contactName, // Use the passed contact name
                          style: const TextStyle(
                            color: Palette.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const Text(
                          "online", // Replace with actual status
                          style: TextStyle(
                            color: Color.fromARGB(255, 98, 98, 98),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {
                      // Handle more options button press
                    },
                  ),
                ],
              ),
            ),

            // Chat Messages Area
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true, // To show latest messages at the bottom
                itemCount: _messages.length,
                itemBuilder: (_, int index) {
                  // Replace with actual message bubble widgets
                  return ListTile(
                    title: Align(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment
                              .centerRight, // Simple alternating alignment
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.white
                              : Colors.greenAccent[100],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(_messages[index]),
                      ),
                    ),
                  );
                },
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
}
