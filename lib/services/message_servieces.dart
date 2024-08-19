import 'package:chat_app/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageServices {
  final firestore = FirebaseFirestore.instance;

  static String getConversationID(String rId, sID) =>
      rId.hashCode <= sID.hashCode ? '${rId}_$sID' : '${sID}_$rId';

  Stream<QuerySnapshot<Map<String, dynamic>>> receiveMessages(String rId, sID) {
    return firestore
        .collection('Chats/${getConversationID(rId, sID)}/Messages')
        .snapshots();
  }

  sentMessage(String rId, sID, message) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final messageModel = MessageModel(
        toId: rId,
        read: '',
        type: Type.text,
        message: message,
        sent: time,
        fromId: sID);
    await firestore
        .collection('Chats/${getConversationID(rId, sID)}/Messages')
        .doc(time)
        .set(messageModel.toJson());
  }

  updateMessageReadStatus(MessageModel message) async {
    await firestore
        .collection(
            'Chats/${getConversationID(message.toId, message.fromId)}/Messages')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(String rId, sID) {
    try {
      return firestore
          .collection('Chats/${getConversationID(rId, sID)}/Messages')
          .orderBy('sent', descending: true)
          .limit(1)
          .snapshots();
    } catch (ex) {
      return const Stream.empty();
    }
  }
}
