import 'package:flutter/material.dart';
import 'package:flutter1project/screens/messenger/entities/message.dart';
import 'package:flutter1project/screens/messenger/widgets/message_input_section.dart';
import 'package:flutter1project/screens/messenger/widgets/messages_list_section.dart';
import 'package:flutter1project/screens/messenger/widgets/messenger_app_bar.dart';
import "package:supabase_flutter/supabase_flutter.dart";

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  final TextEditingController messageController = TextEditingController();
  List<Message>? messagesListArray;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    fetchMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          MessengerAppBar(),
          MessageContent(
            isLoading: isLoading,
            isError: isError,
            messagesListArray: messagesListArray,
          ),
          MessageInputSection(
            sendMessage: sendMessage,
            messageController: messageController,
          ),
        ],
      ),
    ),
  );
  Future<void> sendMessage() async {
    final text = messageController.text;
    final supabase = Supabase.instance.client;
    if (text.isNotEmpty) {
      await supabase.from("messages").insert({
        "text": text,
        "creator": "Michał",
      });
      setState(() {
        messageController.clear();
      });
      await fetchMessages();
    }
  }

  void deleteMessage(int index) {
    // setState(() {
    //   // messagesListArray.removeAt(index);
    // });
  }

  Future<void> fetchMessages() async {
    try {
      final supaBase = Supabase.instance.client;
      final response = await supaBase.from("messages").select() as List;
      final responseData = response
          .map((message) => Message.fromJson(message))
          .toList();
      setState(() {
        messagesListArray = responseData;
        isLoading = false;
      });
    } catch (err) {
      setState(() {
        isError = true;
      });
    }
  }
}

class MessageContent extends StatelessWidget {
  const MessageContent({
    required this.isLoading,
    required this.isError,
    required this.messagesListArray,
    super.key,
  });
  final bool isLoading;
  final bool isError;
  final List<Message>? messagesListArray;
  @override
  Widget build(BuildContext context) {
    if (messagesListArray != null && messagesListArray!.isNotEmpty) {
      return MessagesListSection(
        messagesList: messagesListArray!,
        deleteMessage: (int index) {},
      );
    }
    if (messagesListArray != null && messagesListArray!.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            "Brak wiadomości",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    if (isError) {
      return Text("Wystąpił błąd podczas ładowania wiadomości");
    }
    if (isLoading) {
      return CircularProgressIndicator();
    }
    return Text("Hello");
  }
}
