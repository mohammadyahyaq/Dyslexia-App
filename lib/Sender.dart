import 'package:dyslexia_app/adult.dart';

abstract class Sender extends Adult {
  bool _isOnline;

  bool getIsOnline() {
    return this._isOnline;
  }
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

  Sender getSender() {
    return this._sender;
  }

  Sender getReceiver() {
    return this._receiver;
  }

  String getMessageContent() {
    return this._messageContent;
  }

  DateTime getTime() {
    return this._time;
  }
}