import 'adult.dart';
import 'message.dart';

abstract class Sender extends Adult {
  bool _isOnline;

  bool get isOnline => _isOnline;

  List<Message> getMessages() {
    // TODO: implement getMessages to fitch the messages from the database
    throw UnimplementedError();
  }

  bool sendMessage(Sender sender, Sender receiver, String messageContent) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}