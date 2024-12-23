import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String text;
  final bool isUser;

  const Message({required this.text, required this.isUser});

  @override
  List<Object> get props => [text, isUser];
}
