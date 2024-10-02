import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final txtCtrlr = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    );

    final decoration = InputDecoration(
      hintText: "Write your text here. End it with a '?'.",
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final value = txtCtrlr.value.text;
          txtCtrlr.clear();
          print('send: $value');
        },
      ),
    );

    return TextFormField(
      controller: txtCtrlr,
      decoration: decoration,
      onFieldSubmitted: (value) {
        print('onFieldSubmitted: $value');
        txtCtrlr.clear();
      },
    );
  }
}
