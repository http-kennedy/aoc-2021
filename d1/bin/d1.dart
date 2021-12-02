import 'dart:io';

// hardcode full file path
final input = File('../bin/data.txt').readAsLinesSync();
void main() {
  print(d1p1(input).toString() + ' part 1');
  print(d1p2(input).toString() + ' part 2');
}

int d1p1(Iterable<String> input) {
  var count = 0;
  int? previous;

  for (final next in input.map(int.parse)) {
    if (previous != null && previous < next) {
      count++;
    }
    previous = next;
  }
  return count;
}

int d1p2(Iterable<String> input) {
  var count = 0;
  int? previous;
  final next = input.map(int.parse).toList(growable: false);

  for (var position = 0; position < next.length - 2; position++) {
    final current = next[position] + next[position + 1] + next[position + 2];
    if (previous != null && previous < current) {
      count++;
    }
    previous = current;
  }
  return count;
}
