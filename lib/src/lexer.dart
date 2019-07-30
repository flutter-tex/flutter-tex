import 'error.dart';
import 'source_location.dart';
import 'token.dart';

class LexerInterface {
  LexerInterface(this.input, this.tokenRegex);

  final String input;

  final RegExp tokenRegex;
}

const spaceRegexString = '[ \r\n\t]';
const controlWordRegexString = '\\\\[a-zA-Z@]+';
const controlSymbolRegexString = '\\\\[^\uD800-\uDFFF]';
const controlWordWhitespaceRegexString =
    '$controlWordRegexString$spaceRegexString*';
final controlWordWhitespaceRegex =
    RegExp('^($controlWordRegexString)$spaceRegexString*\$');
const combiningDiacriticalMarkString = '[\u0300-\u036f]';
final combiningDiacriticalMarksEndRegex =
    RegExp('$combiningDiacriticalMarkString+\$');
const tokenRegexString = '($spaceRegexString+)|' + // whitespace
    '([!-\\[\\]-\u2027\u202A-\uD7FF\uF900-\uFFFF]' + // single codepoint
    '$combiningDiacriticalMarkString*' + // ...plus accents
    '|[\uD800-\uDBFF][\uDC00-\uDFFF]' + // surrogate pair
    '$combiningDiacriticalMarkString*' + // ...plus accents
    '|\\\\verb\\*([^]).*?\\3' + // \verb*
    '|\\\\verb([^*a-zA-Z]).*?\\4' + // \verb unstarred
    '|\\\\operatorname\\*' + // \operatorname*
    '|$controlWordWhitespaceRegexString' + // \macroName + spaces
    '|$controlSymbolRegexString)'; // \\, \', etc.

class Lexer extends LexerInterface {
  Lexer(String input) : super(input, RegExp(tokenRegexString)) {
    allMatches = tokenRegex.allMatches(input);
  }

  final Map<String, int> catcodes = {
    '%': 14,
  };

  Iterable<RegExpMatch> allMatches;

  int get lastIndex {
    return allMatches.iterator.current.start;
  }

  void setCatcode(String char, int code) {
    catcodes[char] = code;
  }

  Token lex() {
    if (lastIndex == input.length) {
      return Token('EOF', SourceLocation(this, lastIndex, lastIndex));
    }
    final pos = lastIndex;
    allMatches.iterator.moveNext();
    final match = allMatches.iterator.current;
    if (match == null || match.start != pos) {
      throw ParseError(
          message: 'Unexpected character: \'${input[pos]}\'',
          token: Token(input[pos], SourceLocation(this, pos, pos + 1)));
    }
    var text = match[2] ?? ' ';

    if (catcodes[text] == 14) {
      // comment character
      final nlIndex = input.indexOf('\n', lastIndex);
      if (nlIndex == -1) {
        throw ParseError(
            message: '% comment has no terminating newline; LaTeX would ' +
                'fail because of commenting the end of math mode (e.g. \$)');
      } else {
        allMatches.iterator.moveNext();
      }
      return lex();
    }

    // Trim any trailing whitespace from control word match
    final controlMatch = controlWordWhitespaceRegex.firstMatch(text);
    if (controlMatch != null) {
      text = controlMatch[1];
    }

    return Token(text, SourceLocation(this, pos, lastIndex));
  }
}
