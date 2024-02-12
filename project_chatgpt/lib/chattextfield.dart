import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const ChatTextField(
      {super.key, required this.controller, required this.onSubmitted});
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
              controller: controller,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {
                onSubmitted(controller.text);
              },
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 84, 231, 170),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
