import 'package:flutter_riverpod/flutter_riverpod.dart';

final bloodGroupProvider = StateProvider<List?>((ref) => [
      "A+",
      "A-",
      "B+",
      "B-",
      "AB+",
      "AB-",
      "O+",
      "O-",
    ]);
