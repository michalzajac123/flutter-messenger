import 'package:flutter/material.dart';
import 'package:flutter1project/screens/messenger/entities/message.dart';
import 'package:flutter1project/screens/messenger/widgets/message_bubble.dart';

class MessagesListSection extends StatelessWidget {
  const MessagesListSection({required this.messagesList,required this.deleteMessage, super.key});

  final List<Message> messagesList;
  final Function(int) deleteMessage;
  @override
  Widget build(BuildContext context) => Expanded(
    child: messagesList.isEmpty
        ? Center(child: Text("Brak wiadomości",style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),))
        : ListView.builder(
            itemCount: messagesList.length,
            itemBuilder: (context, index) =>
                MessageBubble(message: messagesList[index].text,deleteMessage: deleteMessage, index: index,creator: messagesList[index].creator,),
          ),
  );
}
