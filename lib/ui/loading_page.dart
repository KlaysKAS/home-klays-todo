import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final String loadingMessage;
  final Color messageColor;

  const LoadingPage({
    Key? key,
    required this.loadingMessage,
    required this.messageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        Text(
          loadingMessage,
          style: TextStyle(
            color: messageColor,
            fontSize: 16,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }
}
