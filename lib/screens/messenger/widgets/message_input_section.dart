import 'package:flutter/material.dart';
import 'package:flutter1project/common_widgets/app_text_field.dart';

class MessageInputSection extends StatelessWidget {
  const MessageInputSection({
    required this.messageController,
    required this.sendMessage,
    super.key,
  });

  final TextEditingController messageController;
  final VoidCallback sendMessage;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      children: [
        Expanded(child: AppTextField(controller: messageController)),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF0084FF),
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: sendMessage,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}
