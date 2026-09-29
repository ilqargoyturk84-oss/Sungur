import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class Paylas {
  static void goster(BuildContext ctx, String basliq, String metn) {
    HapticFeedback.lightImpact();
    showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A0000),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: Color(0xFFFFD700))),
        title: const Row(children: [
          Icon(Icons.share, color: Color(0xFFFFD700)),
          SizedBox(width: 8),
          Text('PAYLAS', style: TextStyle(color: Color(0xFFFFD700), fontSize: 16)),
        ]),
        content: SingleChildScrollView(
          child: Text(metn, style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.5)),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('BAGLA', style: TextStyle(color: Colors.grey))),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(ctx);
              Share.share(basliq + '\n\n' + metn + '\n\n--- Sungur Mistik ile hazirlanib');
            },
            icon: const Icon(Icons.send),
            label: const Text('GONDER'),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFC62828), foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
