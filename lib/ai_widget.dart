import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AIButton extends StatefulWidget {
  final bool hazir;
  final String Function()? getMetn;
  const AIButton({super.key, required this.hazir, this.getMetn});
  @override
  State<AIButton> createState() => _AIButtonState();
}

class _AIButtonState extends State<AIButton> {
  String? metn;
  bool yuklenir = false;

  void analiz() async {
    if (widget.getMetn == null) return;
    setState(() => yuklenir = true);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      metn = widget.getMetn!();
      yuklenir = false;
    });
    HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.hazir) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(height: 12),
      ElevatedButton.icon(
        onPressed: yuklenir ? null : analiz,
        icon: yuklenir
            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
            : const Icon(Icons.psychology),
        label: Text(yuklenir ? 'AI DUSUNUR...' : 'AI ANALIZ', style: const TextStyle(fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      if (metn != null) Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A0000),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.purpleAccent, width: 2),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.psychology, color: Colors.purpleAccent, size: 24),
            SizedBox(width: 8),
            Text('AI ANALIZ', style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize: 14)),
          ]),
          const SizedBox(height: 10),
          Text(metn!, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.5)),
        ]),
      ),
    ]);
  }
}
