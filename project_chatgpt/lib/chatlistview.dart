import 'package:chatgpt/conversation.dart';
import 'package:chatgpt/messagewidget.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatefulWidget {
  final List<Conversation> conversations;
  const ChatListView({super.key, required this.conversations});

  @override
  State<ChatListView> createState() => _ChatListView();
}

class _ChatListView extends State<ChatListView> {
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.conversations.length,
      itemBuilder: (context, index) {
        Conversation conversation = widget.conversations[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            MessageWidget(text: conversation.question),
            const SizedBox(height: 20),
            MessageWidget(text: conversation.answer, fromAi: true),
          ],
        );
      },
    );
  }
}
