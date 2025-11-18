class Message {
  String text;
  String creator;

  Message({required this.text, required this.creator});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(text: json["text"], creator: json["creator"]);
  }
}