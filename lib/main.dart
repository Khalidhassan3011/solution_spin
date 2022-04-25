import 'package:flutter/material.dart';
import 'app/common/util/initializer.dart';
import 'solution_spin_test_task.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const SolutionSpinTestTask());
  });
}