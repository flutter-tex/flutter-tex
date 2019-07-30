import 'source_location.dart';

class Token extends AbstractToken {
  Token(this.text, SourceLocation loc) : super(loc);

  final String text;

  Token range(
    Token endToken,
    String text,
  ) {
    return Token(text, SourceLocation.range(this, endToken));
  }
}
