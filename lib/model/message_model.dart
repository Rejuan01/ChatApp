enum Type { text, image }

class MessageModel {
  MessageModel({
    required this.toId,
    required this.read,
    required this.type,
    required this.message,
    required this.sent,
    required this.fromId,
  });
  late final String toId;
  late String read;
  late final Type type;
  late final String message;
  late final String sent;
  late final String fromId;

  MessageModel.fromJson(Map<String, dynamic> json) {
    toId = json['toId'];
    read = json['read'];
    type = json['type'] == Type.text.name ? Type.text : Type.image;
    message = json['message'];
    sent = json['sent'];
    fromId = json['fromId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['toId'] = toId;
    data['read'] = read;
    data['type'] = type.name;
    data['message'] = message;
    data['sent'] = sent;
    data['fromId'] = fromId;
    return data;
  }
}
