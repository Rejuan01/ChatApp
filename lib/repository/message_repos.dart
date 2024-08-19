import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/services/message_servieces.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  final _messageServices = MessageServices();

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String rId, sId) {
    return _messageServices.receiveMessages(rId, sId);
  }

  Future<void> sentMessages(String rId, sID, message) async {
    _messageServices.sentMessage(rId, sID, message);
  }

  updateReadStatus(MessageModel message) async {
    await _messageServices.updateMessageReadStatus(message);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> lastMessage(String rId, sID) {
    return _messageServices.getLastMessage(rId, sID);
  }
}
