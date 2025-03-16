import 'dart:math';

class GenerateRandom {
  static List<int> generateRandomVector(int length) {
    Random random = Random();
    return List.generate(length, (_) {
      return random.nextInt(100);
    });
  }
}
