// ignore_for_file: file_names

// dart:io package is to read files and whatnot
import 'dart:io';

// hardcode full file path
final input = File('../bin/data.txt').readAsLinesSync();
void main() {
  // dont forget .tostring otherwise its still an int!
  // print(functionName(what data is sent to function))
  print(d1p1(input).toString() + ' part 1');
  print(d1p2(input).toString() + ' part 2');
}

// count greater depths a < b = +1 else a = b
// int functionName(Iterable<asAString> input)
int d1p1(Iterable<String> input) {
  var count = 0;

  // the question marks means it can be null
  int? previous;

  // for each line in data.txt parse as int (final can only be set once)
  for (final next in input.map(int.parse)) {
    // if previous isn't null && previous is < next increase count by 1
    if (previous != null && previous < next) {
      count++;
    }

    // set previous to next and continue
    previous = next;
  }

  // gimme answer back to caller
  return count;
}

// count greater depts a + b + c < b + c + d = +1 // a < d  = +1
int d1p2(Iterable<String> input) {
  var count = 0;
  int? previous;

  // (final means can only be set once) next is set input(int.parse) put into a list that cant be changed
  final next = input.map(int.parse).toList(growable: false);

  // for each line in data.txt
  // position 0 is first in list; position is next.length -2; position +1
  for (var position = 0; position < next.length - 2; position++) {
    // (final means can only be set once) current set to next[position]0,1,& 2 in list
    final current = next[position] + next[position + 1] + next[position + 2];

    // if previous isn't null && previous is less than current increase count by 1
    if (previous != null && previous < current) {
      count++;
    }

    // set previous to current and continue
    previous = current;
  }

  // gimme answer back to caller
  return count;
}
