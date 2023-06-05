import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import '../lib/neural.dart';

void main(List<String> args) async {
  final shape = [2, 4, 4, 2];

  var evaluator = NetworkEvaluator('&', (a, b) => a & b);
  final network = await train(shape, evaluator, 1);
  // final network =? loadFromDisk(shape);

  print('Evaluating');
  var op = evaluator.operand;
  print('[1 $op 0] ${network.forward([1, 0])}');
  print('[0 $op 1] ${network.forward([0, 1])}');
  print('[1 $op 1] ${network.forward([1, 1])}');
  print('[0 $op 0] ${network.forward([1, 0])}');

  // _benchmark(network);

  saveToDisk(shape, network, 'network.bin');
}
