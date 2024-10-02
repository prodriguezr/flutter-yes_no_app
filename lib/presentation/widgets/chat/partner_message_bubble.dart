import 'package:flutter/material.dart';

class PartnerMessageBubble extends StatelessWidget {
  const PartnerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hi!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _ImageBubble(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
          'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif',
          width: size.width * 0.6,
          height: 150,
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Container(
            width: size.width * 0.6,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('My Love ❤️ is sending an image',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center));
      }),
    );
  }
}
