import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Object error;

  const ErrorScreen({required this.error,super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(error);
  }
}
