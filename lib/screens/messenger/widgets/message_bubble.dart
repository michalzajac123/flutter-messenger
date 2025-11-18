import "package:flutter/material.dart";

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.deleteMessage,
    required this.index,
    required this.creator,
    super.key,
  });

  final String message;
  final Function deleteMessage;
  final int index;
  final String creator;

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Potwierdź usunięcie'),
          content: const Text('Czy na pewno chcesz usunąć tę wiadomość?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Anuluj'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deleteMessage(index); 
              },
              child: const Text('Usuń'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerRight,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: Color(0xFF0084FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(4),
        ),
      ),

      child: Padding(
        padding: EdgeInsets.only(right: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    softWrap: true,
                    maxLines: null,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "- $creator",
                    style: TextStyle(color: Colors.white70, fontSize: 15, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
