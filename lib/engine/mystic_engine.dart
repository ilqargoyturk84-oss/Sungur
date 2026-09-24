class MysticEngine {
  // Numerologiya: Ad və doğum tarixinə əsasən həyat yolu nömrəsi
  static int calculateLifePathNumber(DateTime birthDate) {
    int sum = birthDate.day + birthDate.month + birthDate.year;
    while (sum > 9 && sum != 11 && sum != 22 && sum != 33) {
      int tempSum = 0;
      for (var char in sum.toString().split('')) {
        tempSum += int.parse(char);
      }
      sum = tempSum;
    }
    return sum;
  }

  // Cütlük Uyğunluğu Hesablanması (Dual-Pillar Compatibility)
  static double calculateCompatibility(DateTime birthDate1, DateTime birthDate2) {
    int num1 = calculateLifePathNumber(birthDate1);
    int num2 = calculateLifePathNumber(birthDate2);
    
    int diff = (num1 - num2).abs();
    double baseScore = 100.0 - (diff * 10);
    return baseScore.clamp(40.0, 99.9);
  }
}
