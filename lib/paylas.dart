import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Paylas {
  static void goster(BuildContext ctx, String basliq, String metn) {
    Clipboard.setData(ClipboardData(text: basliq + '\n\n' + metn + '\n\n--- Sungur Mistik'));
    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text('Netice kopyalandi! Istənilən yere yapisdirin.'),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
