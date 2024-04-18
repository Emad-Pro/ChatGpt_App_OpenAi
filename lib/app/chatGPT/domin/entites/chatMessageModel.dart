class ChatMessage {
  final String? text;
  final bool? isMe;
  final String? time;

  ChatMessage({this.text, this.isMe = false, this.time});
  Map<String, dynamic> toMap() {
    return {"text": text, "isMe": isMe, "time": time};
  }

  ChatMessage.fromMap(Map map) // This Function helps to convert our Map into our User Object
      : text = map["text"],
        isMe = map["isMe"],
        time = map["time"];
}
