import 'package:flutter/material.dart';

// Shows error snackBar. Of course we can define a lot of errors
// and custom messages for known scenarios
Future<void> showErrorSnackBar(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar(message));
}

SnackBar _errorSnackBar(String message) {
  return SnackBar(
      duration: const Duration(seconds: 1),
      content: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
              child: Text(message, maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
  );
}