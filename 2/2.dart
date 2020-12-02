import 'dart:io';

Future<void> main() async {
  final input = new File('input.txt');

  final String inputString = input.readAsStringSync();

  final values = inputString.split(';');

  var validPasswords = 0;

  for (var value in values) {
    final int minOccurance = int.tryParse(value.split('-').first);
    //print('${value.split('-')}\n');

    final _helpSplit = value.split('-').last.split(' ');

    final int maxOccurance = int.tryParse(_helpSplit.first);

    final char = _helpSplit[1][(_helpSplit[1].indexOf(":") - 1)];

    final pattern = _helpSplit.last;

    final charOccurance = char.allMatches(pattern).length;

    if (charOccurance >= minOccurance && charOccurance <= maxOccurance) {
      validPasswords++;
    }
  }
  print('Part1: $validPasswords');

  validPasswords = 0;
  for (var value in values) {
    final int minOccurance = int.tryParse(value.split('-').first);
    //print('${value.split('-')}\n');

    final _helpSplit = value.split('-').last.split(' ');

    final int maxOccurance = int.tryParse(_helpSplit.first);

    final char = _helpSplit[1][(_helpSplit[1].indexOf(":") - 1)];

    final pattern = _helpSplit.last;

    if (maxOccurance <= pattern.length) {
      var firstPosition, secondPosition;
      firstPosition = pattern[minOccurance - 1];
      secondPosition = pattern[maxOccurance - 1];

      if ((firstPosition == char && secondPosition != char) ||
          (firstPosition != char && secondPosition == char)) {
        print('$pattern $minOccurance $maxOccurance $char');
        validPasswords++;
      }
    }
  }
  print('Part2: $validPasswords');
}
