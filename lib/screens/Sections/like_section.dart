import "package:flutter/material.dart";

class LikeSection extends StatefulWidget {
  const LikeSection({super.key});

  @override
  State<LikeSection> createState() => _LikeSectionState();
}

class _LikeSectionState extends State<LikeSection> {
  bool isLiked = false;
  int likeCount = 0;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      GestureDetector(
        onTap: switchLike,
        child: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          size: 45,
          color: isLiked ? Colors.red : Colors.black,
        ),
      ),
      SizedBox(width: 20),
      Text(likeCount.toString(), style: TextStyle(fontSize: 20)),
    ],
  );

  void switchLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount++;
    });
  }
}

// class LikeSection extends StatelessWidget {
//   const LikeSection({super.key});

//   @override
//   Widget build(BuildContext context) =>
// }
