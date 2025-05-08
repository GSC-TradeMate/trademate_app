import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:trademate_app/presentation/chat/widgets/chat_screen_view.dart';
import 'package:trademate_app/theme/palette.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;

  const ChatListItem({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Use InkWell for tap effect
      onTap: () {
        // Navigate to the ChatScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChatScreen(contactName: name)), // Pass contact name
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Palette.primaryBgWeak,
              child: Icon(TablerIcons.user, color: Palette.primaryDef),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    lastMessage,
                    style: TextStyle(
                      color: Palette.grey,
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              time,
              style: TextStyle(
                color: Palette.grey,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
