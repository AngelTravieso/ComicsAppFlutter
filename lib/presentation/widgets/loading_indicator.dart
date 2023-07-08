import 'package:flutter/material.dart';

/// class [LoadingIndicator]
/// This widget displays a loading indicator with an optional loading text.
///
/// It shows a centered column containing a circular progress indicator and the loading text.
/// The default loading text is 'Loading data...'.
class LoadingIndicator extends StatelessWidget {
  final String loadingText;

  const LoadingIndicator({
    super.key,
    this.loadingText = 'Loading data...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(
            strokeWidth: 2.5,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(loadingText)
        ],
      ),
    );
  }
}
