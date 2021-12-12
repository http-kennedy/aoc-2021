import 'dart:io';

// hardcode full file path
final input = File('./bin/data.txt').readAsLinesSync();

void main() {
  print(d2p1(input).toString() + ' part 1');
  print(d2p2(input).toString() + ' part 2');
}

int d2p1(List<String> input) {
  var horizontal = 0;
  var vertical = 0;

  for (var instruction in input) {
    var instructionNew = instruction.split(' ');
    var direction = instructionNew[0];
    var distance = int.parse(instructionNew[1]);
    switch (direction) {
      case "down":
        vertical += distance;
        break;
      case "forward":
        horizontal += distance;
        break;
      case "up":
        vertical -= distance;
        break;
      default:
        exit;
    }
  }
  return (horizontal * vertical);
}

int d2p2(List<String> input) {
  var horizontal = 0;
  var vertical = 0;
  var aim = 0;

  for (var instruction in input) {
    var instructionNew = instruction.split(' ');
    var direction = instructionNew[0];
    var distance = int.parse(instructionNew[1]);
    switch (direction) {
      case "down":
        aim += distance;
        break;
      case "forward":
        horizontal += distance;
        vertical += aim * distance;
        break;
      case "up":
        aim -= distance;
        break;
      default:
        exit;
    }
  }
  return (horizontal * vertical);
}
