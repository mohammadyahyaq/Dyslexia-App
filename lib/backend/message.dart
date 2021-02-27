import 'sender.dart';

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