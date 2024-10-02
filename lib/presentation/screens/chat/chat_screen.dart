import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/partner_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.chatfai.com/public_characters/Ru96THehe3adC8qPHo0tIQnfZZz2/cab34610-5b80-48b8-b3e8-12bf7b84b12fThe_Original_Mommy.256.462754.jpg'),
          ),
        ),
        title: const Text('My Love ❤️'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Container(
        color: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: chatProvider.scrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];

                    return message.from == From.me
                        ? MyMessageBubble(message: message)
                        : PartnerMessageBubble(message: message);
                  },
                ),
              ),
              MessageFieldBox(
                onValueChanged: chatProvider.sendMessage,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
