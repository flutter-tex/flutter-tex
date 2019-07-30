import 'source_location.dart';

class ParseError extends Error {
  ParseError({
    String message,
    AbstractToken token,
  }) {
    error = 'KaTeX parse error: ' + message;
    int start;

    final loc = token != null ? token.loc : null;
    if (loc != null && loc.start <= loc.end) {
      final input = loc.lexer.input;

      // Prepend some information
      start = loc.start;
      final end = loc.end;
      if (start == input.length) {
        error += ' at end of input: ';
      } else {
        error += ' at position ${start + 1} : ';
      }

      final underlined =
          input.substring(start, end).replaceAll(RegExp(r'/[^]/'), r'$&\u0332');

      String left;
      if (start > 15) {
        left = '…' + input.substring(start - 15, start);
      } else {
        left = input.substring(0, start);
      }
      String right;
      if (end + 15 < input.length) {
        right = input.substring(end, end + 15) + '…';
      } else {
        right = input.substring(end);
      }
      error += left + underlined + right;
    }

    position = start;
  }

  int position;

  String error;

  @override
  String toString() {
    return error;
  }
}
