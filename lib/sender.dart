import 'package:dyslexia_app/adult.dart';

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

class Message {
  Sender _sender;
  Sender _receiver;
  String _messageContent;
  DateTime _time;

  Sender get sender => _sender;

  Sender get receiver => _receiver;

  String get messageContent => _messageContent;

  DateTime get time => _time;
}