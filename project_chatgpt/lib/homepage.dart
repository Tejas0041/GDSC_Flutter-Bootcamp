import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'chatlistview.dart';
import 'chattextfield.dart';
import 'conversation.dart';
import 'example.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<Conversation> conversations = [];
  final TextEditingController controller = TextEditingController();

  bool get isConversationStarted => conversations.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ChatGPT',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 52, 53, 65),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 52, 53, 65),
              Color.fromARGB(255, 52, 53, 60),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isConversationStarted) ...[
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Image.network(
                      'https://static.vecteezy.com/system/resources/previews/022/841/114/original/chatgpt-logo-transparent-background-free-png.png',
                      height: 55,
                    ),
                    const SizedBox(height: 15),
                    const Column(
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'ChatGPT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ask anything, get your answer',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 28,
                          color: Colors.white,
                        ),
                        Text(
                          'Examples',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Column(
                        children: [
                          Example(
                            text: 'Explain quantum computing in simple terms',
                          ),
                          Example(
                            text:
                                "Got any creative ideas for 10 year old's boy birthday?",
                          ),
                          Example(
                            text: 'How to make an HTTP request in Javascript',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ] else
              Expanded(
                child: ChatListView(
                  conversations: conversations,
                ),
              ),
            if (!isConversationStarted) const Expanded(child: SizedBox()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ChatTextField(
                  controller: controller,
                  onSubmitted: (question) {
                    //API CALL
                    controller.clear();
                    conversations.add(Conversation(question, ""));
                    setState(() {});
                    post(Uri.parse("http://10.0.2.2:8000/get-response"),
                            body: jsonEncode({"text": question}),
                            headers: {"Content-Type": "application/json"})
                        .then((response) {
                      String result = jsonDecode(response.body)['response'];
                      conversations.last =
                          Conversation(conversations.last.question, result);
                      setState(() {});
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
