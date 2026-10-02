import 'package:flutter/material.dart';
import 'main.dart';

class GununAy extends StatelessWidget {
  const GununAy({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    int idx = (now.day + now.month * 31 + now.year) % 28;
    final az = ['Serateyn','Betn əl-Hut','Sureya','Debaran','Heqeh','Henneh','Zire','Nesre','Terfe','Cebhe','Zubra','Serfe','Ava','Simak','Gafr','Zubana','Iklil','Qelb','Sovle','Neayim','Belde','Sed əl-Zabih','Sed əl-Bula','Sed əs-Suud','Sed əl-Ahbiye','Ferğ əl-Mukdim','Ferğ əl-Muaxir','Risa'];
    final tr = ['Şeretayn','Betn el-Hut','Süreyya','Debaran','Hekah','Henne','Zira','Nesre','Terfe','Cebhe','Zubra','Serfe','Ava','Simak','Gafr','Zubana','İklil','Kalp','Şevle','Neayim','Belde','Sad ez-Zabih','Sad el-Bula','Sad es-Suud','Sad el-Ahbiye','Ferğ el-Mukdim','Ferğ el-Muaxir','Rişa'];
    final en = ['Sharatayn','Butayn','Thurayya','Dabaran','Haqah','Hanah','Dhira','Nathra','Tarfa','Jabhah','Zubrah','Sarfah','Awwa','Simak','Ghafr','Zubana','Iklil','Qalb','Shawla','Naim','Baldah','Sad al-Dhabih','Sad al-Bulah','Sad al-Suud','Sad al-Akhbiyah','Fargh al-Muqaddim','Fargh al-Muakhkhar','Risha'];
    String m = L.kod == 'az' ? az[idx] : (L.kod == 'tr' ? tr[idx] : en[idx]);
    String b = L.kod == 'az' ? 'GUNUN AY MENZILI' : (L.kod == 'tr' ? 'GÜNÜN AY MENZİLİ' : 'MOON MANSION');
    String a = L.kod == 'az' ? 'Ay enerjisi bugun sizinle' : (L.kod == 'tr' ? 'Ay enerjisi bugün sizinle' : 'Moon energy is with you');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1A0000), Color(0xFF0A0A0A)]),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.indigoAccent.withOpacity(0.5)),
      ),
      child: Row(children: [
        const Icon(Icons.nightlight_round, color: Colors.indigoAccent, size: 36),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(b, style: const TextStyle(color: Colors.indigoAccent, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(m, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(a, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ])),
      ]),
    );
  }
}
