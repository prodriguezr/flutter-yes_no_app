import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messageList = [
    Message(
      text: 'Hi!',
      createdAt: DateTime.now(),
      from: From.me,
    ),
    Message(
      text: 'Have you returned from work yet?',
      createdAt: DateTime.now(),
      from: From.me,
    ),
  ];

  void sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(
      text: text,
      createdAt: DateTime.now(),
      from: From.me,
    );

    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await partnerReply();
    }

    notifyListeners();

    scrollToBottom();
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<Message> partnerReply() async {
    final partnerMessage = await getYesNoAnswer.getAnswer();

    messageList.add(partnerMessage);

    notifyListeners();

    scrollToBottom();

    return partnerMessage;
  }
}
