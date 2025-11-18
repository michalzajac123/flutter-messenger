import 'package:flutter/material.dart';

class MessengerAppBar extends StatelessWidget {
  const MessengerAppBar({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://cdn.freebiesupply.com/logos/large/2x/facebook-messenger-logo-png-transparent.png",
            ),
          ),
          SizedBox(width: 20),
          Text(
            "Messenger",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ],
      ),
    ),
  );
}
