import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading movies',
      'Buying popcorn',
      'Loading popular movies',
      'Calling my girlfriend',
      'About to begin',
      'This is taking longer than expected :(',
    ];
    return Stream.periodic(const Duration(seconds: 5), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          const Text('Cinemapedia'),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
