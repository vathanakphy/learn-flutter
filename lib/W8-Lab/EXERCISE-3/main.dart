import 'package:basic/W8-Lab/EXERCISE-3/data/profile_data.dart';
import 'package:flutter/material.dart';

import 'ui/screens/profile.dart';

class Exercise3Week8 {
  static void main() {
    runApp(
      MaterialApp(debugShowCheckedModeBanner: false, home: ProfileApp(profileData: ronanProfile,)),
    );
  }
}
