import 'lexer.dart';

class AbstractToken {
  AbstractToken(this.loc);

  final SourceLocation loc;
}

class SourceLocation {
  SourceLocation(this.lexer, this.start, this.end);

  final LexerInterface lexer;
  final int start;
  final int end;

  static SourceLocation range(AbstractToken first, AbstractToken second) {
    if (second == null) {
      return first ?? first.loc;
    } else if (first == null ||
        first.loc == null ||
        second.loc == null ||
        first.loc.lexer != second.loc.lexer) {
      return null;
    } else {
      return SourceLocation(first.loc.lexer, first.loc.start, second.loc.end);
    }
  }
}
