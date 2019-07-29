const Map<String, Map<String, CharInfo>> symbols = {
  'math': {},
  'text': {},
};

enum Font {
  Main,
  AMS,
}

enum Mode {
  Math,
  Text,
}

const ATOMS = {
  'bin': 1,
  'close': 1,
  'inner': 1,
  'open': 1,
  'punct': 1,
  'rel': 1,
};

const NON_ATOMS = {
  'accent-token': 1,
  'mathord': 1,
  'op-token': 1,
  'spacing': 1,
  'textord': 1,
};

enum Group {
  Bin,
  Close,
  Inner,
  Open,
  Punct,
  Rel,
  AccentToken,
  Mathord,
  OpToken,
  Spacing,
  Textord,
}

class CharInfo {
  CharInfo(this.font, this.group, this.replace);

  final Font font;

  final Group group;

  final String replace;
}

// `acceptUnicodeChar = true` is only applicable if `replace` is set.
void defineSymbol(
    Mode mode, Font font, Group group, String replace, String name,
    {bool acceptUnicodeChar = false}) {
  symbols[mode][name] = CharInfo(font, group, replace);

  if (acceptUnicodeChar && replace != null && replace.isEmpty) {
    symbols[mode][replace] = symbols[mode][name];
  }
}

// Some abbreviations for commonly used strings.
// This helps minify the code, and also spotting typos using jshint.

// modes:
const math = Mode.Math;
const text = Mode.Text;

// fonts:
const main = Font.Main;
const ams = Font.AMS;

// groups:
const accent = Group.AccentToken;
const bin = Group.Bin;
const close = Group.Close;
const inner = Group.Inner;
const mathord = Group.Mathord;
const op = Group.OpToken;
const open = Group.Open;
const punct = Group.Punct;
const rel = Group.Rel;
const spacing = Group.Spacing;
const textord = Group.Textord;

// Now comes the symbol table

void defineTable() {
  // Relation Symbols
  defineSymbol(math, main, rel, '\u2261', '\\equiv', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u227a', '\\prec', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u227b', '\\succ', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u223c', '\\sim', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u22a5', '\\perp');
  defineSymbol(math, main, rel, '\u2aaf', '\\preceq', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2ab0', '\\succeq', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2243', '\\simeq', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2223', '\\mid', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u226a', '\\ll', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u226b', '\\gg', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u224d', '\\asymp', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2225', '\\parallel');
  defineSymbol(math, main, rel, '\u22c8', '\\bowtie', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2323', '\\smile', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2291', '\\sqsubseteq',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2292', '\\sqsupseteq',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2250', '\\doteq', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2322', '\\frown', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u220b', '\\ni', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u221d', '\\propto', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u22a2', '\\vdash', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u22a3', '\\dashv', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u220b', '\\owns');

// Punctuation
  defineSymbol(math, main, punct, '\u002e', '\\ldotp');
  defineSymbol(math, main, punct, '\u22c5', '\\cdotp');

// Misc Symbols
  defineSymbol(math, main, textord, '\u0023', '\\#');
  defineSymbol(text, main, textord, '\u0023', '\\#');
  defineSymbol(math, main, textord, '\u0026', '\\&');
  defineSymbol(text, main, textord, '\u0026', '\\&');
  defineSymbol(math, main, textord, '\u2135', '\\aleph',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2200', '\\forall',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u210f', '\\hbar',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2203', '\\exists',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2207', '\\nabla',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u266d', '\\flat',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2113', '\\ell', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u266e', '\\natural',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2663', '\\clubsuit',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2118', '\\wp', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u266f', '\\sharp',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2662', '\\diamondsuit',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u211c', '\\Re', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2661', '\\heartsuit',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2111', '\\Im', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2660', '\\spadesuit',
      acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00a7', '\\S', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00b6', '\\P', acceptUnicodeChar: true);

// Math and Text
  defineSymbol(math, main, textord, '\u2020', '\\dag');
  defineSymbol(text, main, textord, '\u2020', '\\dag');
  defineSymbol(text, main, textord, '\u2020', '\\textdagger');
  defineSymbol(math, main, textord, '\u2021', '\\ddag');
  defineSymbol(text, main, textord, '\u2021', '\\ddag');
  defineSymbol(text, main, textord, '\u2021', '\\textdaggerdbl');

// Large Delimiters
  defineSymbol(math, main, close, '\u23b1', '\\rmoustache',
      acceptUnicodeChar: true);
  defineSymbol(math, main, open, '\u23b0', '\\lmoustache',
      acceptUnicodeChar: true);
  defineSymbol(math, main, close, '\u27ef', '\\rgroup',
      acceptUnicodeChar: true);
  defineSymbol(math, main, open, '\u27ee', '\\lgroup', acceptUnicodeChar: true);

// Binary Operators
  defineSymbol(math, main, bin, '\u2213', '\\mp', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2296', '\\ominus', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u228e', '\\uplus', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2293', '\\sqcap', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2217', '\\ast');
  defineSymbol(math, main, bin, '\u2294', '\\sqcup', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u25ef', '\\bigcirc');
  defineSymbol(math, main, bin, '\u2219', '\\bullet');
  defineSymbol(math, main, bin, '\u2021', '\\ddagger');
  defineSymbol(math, main, bin, '\u2240', '\\wr', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2a3f', '\\amalg');
  defineSymbol(math, main, bin, '\u0026', '\\And'); // from amsmath

// Arrow Symbols
  defineSymbol(math, main, rel, '\u27f5', '\\longleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21d0', '\\Leftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u27f8', '\\Longleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u27f6', '\\longrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21d2', '\\Rightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u27f9', '\\Longrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2194', '\\leftrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u27f7', '\\longleftrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21d4', '\\Leftrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u27fa', '\\Longleftrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21a6', '\\mapsto', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u27fc', '\\longmapsto',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2197', '\\nearrow', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21a9', '\\hookleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21aa', '\\hookrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2198', '\\searrow', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21bc', '\\leftharpoonup',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21c0', '\\rightharpoonup',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2199', '\\swarrow', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21bd', '\\leftharpoondown',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21c1', '\\rightharpoondown',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2196', '\\nwarrow', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21cc', '\\rightleftharpoons',
      acceptUnicodeChar: true);

// AMS Negated Binary Relations
  defineSymbol(math, ams, rel, '\u226e', '\\nless', acceptUnicodeChar: true);
// Symbol names preceeded by '@' each have a corresponding macro.
  defineSymbol(math, ams, rel, '\ue010', '\\@nleqslant');
  defineSymbol(math, ams, rel, '\ue011', '\\@nleqq');
  defineSymbol(math, ams, rel, '\u2a87', '\\lneq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2268', '\\lneqq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue00c', '\\@lvertneqq');
  defineSymbol(math, ams, rel, '\u22e6', '\\lnsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a89', '\\lnapprox', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2280', '\\nprec', acceptUnicodeChar: true);
// unicode-math maps \u22e0 to \npreccurlyeq. We'll use the AMS synonym.
  defineSymbol(math, ams, rel, '\u22e0', '\\npreceq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22e8', '\\precnsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2ab9', '\\precnapprox',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2241', '\\nsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue006', '\\@nshortmid');
  defineSymbol(math, ams, rel, '\u2224', '\\nmid', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22ac', '\\nvdash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22ad', '\\nvDash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22ea', '\\ntriangleleft');
  defineSymbol(math, ams, rel, '\u22ec', '\\ntrianglelefteq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u228a', '\\subsetneq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue01a', '\\@varsubsetneq');
  defineSymbol(math, ams, rel, '\u2acb', '\\subsetneqq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue017', '\\@varsubsetneqq');
  defineSymbol(math, ams, rel, '\u226f', '\\ngtr', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue00f', '\\@ngeqslant');
  defineSymbol(math, ams, rel, '\ue00e', '\\@ngeqq');
  defineSymbol(math, ams, rel, '\u2a88', '\\gneq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2269', '\\gneqq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue00d', '\\@gvertneqq');
  defineSymbol(math, ams, rel, '\u22e7', '\\gnsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a8a', '\\gnapprox', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2281', '\\nsucc', acceptUnicodeChar: true);
// unicode-math maps \u22e1 to \nsucccurlyeq. We'll use the AMS synonym.
  defineSymbol(math, ams, rel, '\u22e1', '\\nsucceq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22e9', '\\succnsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2aba', '\\succnapprox',
      acceptUnicodeChar: true);
// unicode-math maps \u2246 to \simneqq. We'll use the AMS synonym.
  defineSymbol(math, ams, rel, '\u2246', '\\ncong', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue007', '\\@nshortparallel');
  defineSymbol(math, ams, rel, '\u2226', '\\nparallel',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22af', '\\nVDash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22eb', '\\ntriangleright');
  defineSymbol(math, ams, rel, '\u22ed', '\\ntrianglerighteq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue018', '\\@nsupseteqq');
  defineSymbol(math, ams, rel, '\u228b', '\\supsetneq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue01b', '\\@varsupsetneq');
  defineSymbol(math, ams, rel, '\u2acc', '\\supsetneqq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue019', '\\@varsupsetneqq');
  defineSymbol(math, ams, rel, '\u22ae', '\\nVdash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2ab5', '\\precneqq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2ab6', '\\succneqq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\ue016', '\\@nsubseteqq');
  defineSymbol(math, ams, bin, '\u22b4', '\\unlhd');
  defineSymbol(math, ams, bin, '\u22b5', '\\unrhd');

// AMS Negated Arrows
  defineSymbol(math, ams, rel, '\u219a', '\\nleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u219b', '\\nrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21cd', '\\nLeftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21cf', '\\nRightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21ae', '\\nleftrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21ce', '\\nLeftrightarrow',
      acceptUnicodeChar: true);

// AMS Misc
  defineSymbol(math, ams, rel, '\u25b3', '\\vartriangle');
  defineSymbol(math, ams, textord, '\u210f', '\\hslash');
  defineSymbol(math, ams, textord, '\u25bd', '\\triangledown');
  defineSymbol(math, ams, textord, '\u25ca', '\\lozenge');
  defineSymbol(math, ams, textord, '\u24c8', '\\circledS');
  defineSymbol(math, ams, textord, '\u00ae', '\\circledR');
  defineSymbol(text, ams, textord, '\u00ae', '\\circledR');
  defineSymbol(math, ams, textord, '\u2221', '\\measuredangle',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2204', '\\nexists');
  defineSymbol(math, ams, textord, '\u2127', '\\mho');
  defineSymbol(math, ams, textord, '\u2132', '\\Finv', acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2141', '\\Game', acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2035', '\\backprime');
  defineSymbol(math, ams, textord, '\u25b2', '\\blacktriangle');
  defineSymbol(math, ams, textord, '\u25bc', '\\blacktriangledown');
  defineSymbol(math, ams, textord, '\u25a0', '\\blacksquare');
  defineSymbol(math, ams, textord, '\u29eb', '\\blacklozenge');
  defineSymbol(math, ams, textord, '\u2605', '\\bigstar');
  defineSymbol(math, ams, textord, '\u2222', '\\sphericalangle',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2201', '\\complement',
      acceptUnicodeChar: true);
// unicode-math maps U+F0 (ð) to \matheth. We map to AMS function \eth
  defineSymbol(math, ams, textord, '\u00f0', '\\eth', acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2571', '\\diagup');
  defineSymbol(math, ams, textord, '\u2572', '\\diagdown');
  defineSymbol(math, ams, textord, '\u25a1', '\\square');
  defineSymbol(math, ams, textord, '\u25a1', '\\Box');
  defineSymbol(math, ams, textord, '\u25ca', '\\Diamond');
// unicode-math maps U+A5 to \mathyen. We map to AMS function \yen
  defineSymbol(math, ams, textord, '\u00a5', '\\yen', acceptUnicodeChar: true);
  defineSymbol(text, ams, textord, '\u00a5', '\\yen', acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2713', '\\checkmark',
      acceptUnicodeChar: true);
  defineSymbol(text, ams, textord, '\u2713', '\\checkmark');

// AMS Hebrew
  defineSymbol(math, ams, textord, '\u2136', '\\beth', acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2138', '\\daleth',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2137', '\\gimel',
      acceptUnicodeChar: true);

// AMS Greek
  defineSymbol(math, ams, textord, '\u03dd', '\\digamma',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u03f0', '\\varkappa');

// AMS Delimiters
  defineSymbol(math, ams, open, '\u250c', '\\ulcorner',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, close, '\u2510', '\\urcorner',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, open, '\u2514', '\\llcorner',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, close, '\u2518', '\\lrcorner',
      acceptUnicodeChar: true);

// AMS Binary Relations
  defineSymbol(math, ams, rel, '\u2266', '\\leqq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a7d', '\\leqslant', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a95', '\\eqslantless',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2272', '\\lesssim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a85', '\\lessapprox',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u224a', '\\approxeq', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22d6', '\\lessdot');
  defineSymbol(math, ams, rel, '\u22d8', '\\lll', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2276', '\\lessgtr', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22da', '\\lesseqgtr',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a8b', '\\lesseqqgtr',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2251', '\\doteqdot');
  defineSymbol(math, ams, rel, '\u2253', '\\risingdotseq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2252', '\\fallingdotseq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u223d', '\\backsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22cd', '\\backsimeq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2ac5', '\\subseteqq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22d0', '\\Subset', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u228f', '\\sqsubset', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u227c', '\\preccurlyeq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22de', '\\curlyeqprec',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u227e', '\\precsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2ab7', '\\precapprox',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22b2', '\\vartriangleleft');
  defineSymbol(math, ams, rel, '\u22b4', '\\trianglelefteq');
  defineSymbol(math, ams, rel, '\u22a8', '\\vDash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22aa', '\\Vvdash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2323', '\\smallsmile');
  defineSymbol(math, ams, rel, '\u2322', '\\smallfrown');
  defineSymbol(math, ams, rel, '\u224f', '\\bumpeq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u224e', '\\Bumpeq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2267', '\\geqq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a7e', '\\geqslant', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a96', '\\eqslantgtr',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2273', '\\gtrsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a86', '\\gtrapprox',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22d7', '\\gtrdot');
  defineSymbol(math, ams, rel, '\u22d9', '\\ggg', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2277', '\\gtrless', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22db', '\\gtreqless',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2a8c', '\\gtreqqless',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2256', '\\eqcirc', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2257', '\\circeq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u225c', '\\triangleq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u223c', '\\thicksim');
  defineSymbol(math, ams, rel, '\u2248', '\\thickapprox');
  defineSymbol(math, ams, rel, '\u2ac6', '\\supseteqq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22d1', '\\Supset', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2290', '\\sqsupset', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u227d', '\\succcurlyeq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22df', '\\curlyeqsucc',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u227f', '\\succsim', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2ab8', '\\succapprox',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22b3', '\\vartriangleright');
  defineSymbol(math, ams, rel, '\u22b5', '\\trianglerighteq');
  defineSymbol(math, ams, rel, '\u22a9', '\\Vdash', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2223', '\\shortmid');
  defineSymbol(math, ams, rel, '\u2225', '\\shortparallel');
  defineSymbol(math, ams, rel, '\u226c', '\\between', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22d4', '\\pitchfork',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u221d', '\\varpropto');
  defineSymbol(math, ams, rel, '\u25c0', '\\blacktriangleleft');
// unicode-math says that \therefore is a mathord atom.
// We kept the amssymb atom type, which is rel.
  defineSymbol(math, ams, rel, '\u2234', '\\therefore',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u220d', '\\backepsilon');
  defineSymbol(math, ams, rel, '\u25b6', '\\blacktriangleright');
// unicode-math says that \because is a mathord atom.
// We kept the amssymb atom type, which is rel.
  defineSymbol(math, ams, rel, '\u2235', '\\because', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22d8', '\\llless');
  defineSymbol(math, ams, rel, '\u22d9', '\\gggtr');
  defineSymbol(math, ams, bin, '\u22b2', '\\lhd');
  defineSymbol(math, ams, bin, '\u22b3', '\\rhd');
  defineSymbol(math, ams, rel, '\u2242', '\\eqsim', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u22c8', '\\Join');
  defineSymbol(math, ams, rel, '\u2251', '\\Doteq', acceptUnicodeChar: true);

// AMS Binary Operators
  defineSymbol(math, ams, bin, '\u2214', '\\dotplus', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u2216', '\\smallsetminus');
  defineSymbol(math, ams, bin, '\u22d2', '\\Cap', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22d3', '\\Cup', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u2a5e', '\\doublebarwedge',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u229f', '\\boxminus', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u229e', '\\boxplus', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22c7', '\\divideontimes',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22c9', '\\ltimes', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22ca', '\\rtimes', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22cb', '\\leftthreetimes',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22cc', '\\rightthreetimes',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22cf', '\\curlywedge',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22ce', '\\curlyvee', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u229d', '\\circleddash',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u229b', '\\circledast',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22c5', '\\centerdot');
  defineSymbol(math, ams, bin, '\u22ba', '\\intercal', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22d2', '\\doublecap');
  defineSymbol(math, ams, bin, '\u22d3', '\\doublecup');
  defineSymbol(math, ams, bin, '\u22a0', '\\boxtimes', acceptUnicodeChar: true);

// AMS Arrows
// Note: unicode-math maps \u21e2 to their own function \rightdasharrow.
// We'll map it to AMS function \dashrightarrow. It produces the same atom.
  defineSymbol(math, ams, rel, '\u21e2', '\\dashrightarrow',
      acceptUnicodeChar: true);
// unicode-math maps \u21e0 to \leftdasharrow. We'll use the AMS synonym.
  defineSymbol(math, ams, rel, '\u21e0', '\\dashleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c7', '\\leftleftarrows',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c6', '\\leftrightarrows',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21da', '\\Lleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u219e', '\\twoheadleftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21a2', '\\leftarrowtail',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21ab', '\\looparrowleft',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21cb', '\\leftrightharpoons',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21b6', '\\curvearrowleft',
      acceptUnicodeChar: true);
// unicode-math maps \u21ba to \acwopencirclearrow. We'll use the AMS synonym.
  defineSymbol(math, ams, rel, '\u21ba', '\\circlearrowleft',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21b0', '\\Lsh', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c8', '\\upuparrows',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21bf', '\\upharpoonleft',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c3', '\\downharpoonleft',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u22b8', '\\multimap', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21ad', '\\leftrightsquigarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c9', '\\rightrightarrows',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c4', '\\rightleftarrows',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21a0', '\\twoheadrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21a3', '\\rightarrowtail',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21ac', '\\looparrowright',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21b7', '\\curvearrowright',
      acceptUnicodeChar: true);
// unicode-math maps \u21bb to \cwopencirclearrow. We'll use the AMS synonym.
  defineSymbol(math, ams, rel, '\u21bb', '\\circlearrowright',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21b1', '\\Rsh', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21ca', '\\downdownarrows',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21be', '\\upharpoonright',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21c2', '\\downharpoonright',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21dd', '\\rightsquigarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21dd', '\\leadsto');
  defineSymbol(math, ams, rel, '\u21db', '\\Rrightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u21be', '\\restriction');

  defineSymbol(math, main, textord, '\u2018', '`');
  defineSymbol(math, main, textord, r'$', r'\\$');
  defineSymbol(text, main, textord, r'$', r'\\$');
  defineSymbol(text, main, textord, r'$', '\\textdollar');
  defineSymbol(math, main, textord, '%', '\\%');
  defineSymbol(text, main, textord, '%', '\\%');
  defineSymbol(math, main, textord, '_', '\\_');
  defineSymbol(text, main, textord, '_', '\\_');
  defineSymbol(text, main, textord, '_', '\\textunderscore');
  defineSymbol(math, main, textord, '\u2220', '\\angle',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u221e', '\\infty',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2032', '\\prime');
  defineSymbol(math, main, textord, '\u25b3', '\\triangle');
  defineSymbol(math, main, textord, '\u0393', '\\Gamma',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u0394', '\\Delta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u0398', '\\Theta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u039b', '\\Lambda',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u039e', '\\Xi', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u03a0', '\\Pi', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u03a3', '\\Sigma',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u03a5', '\\Upsilon',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u03a6', '\\Phi', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u03a8', '\\Psi', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u03a9', '\\Omega',
      acceptUnicodeChar: true);
  defineSymbol(math, main, textord, 'A', '\u0391');
  defineSymbol(math, main, textord, 'B', '\u0392');
  defineSymbol(math, main, textord, 'E', '\u0395');
  defineSymbol(math, main, textord, 'Z', '\u0396');
  defineSymbol(math, main, textord, 'H', '\u0397');
  defineSymbol(math, main, textord, 'I', '\u0399');
  defineSymbol(math, main, textord, 'K', '\u039A');
  defineSymbol(math, main, textord, 'M', '\u039C');
  defineSymbol(math, main, textord, 'N', '\u039D');
  defineSymbol(math, main, textord, 'O', '\u039F');
  defineSymbol(math, main, textord, 'P', '\u03A1');
  defineSymbol(math, main, textord, 'T', '\u03A4');
  defineSymbol(math, main, textord, 'X', '\u03A7');
  defineSymbol(math, main, textord, '\u00ac', '\\neg', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u00ac', '\\lnot');
  defineSymbol(math, main, textord, '\u22a4', '\\top');
  defineSymbol(math, main, textord, '\u22a5', '\\bot');
  defineSymbol(math, main, textord, '\u2205', '\\emptyset');
  defineSymbol(math, ams, textord, '\u2205', '\\varnothing');
  defineSymbol(math, main, mathord, '\u03b1', '\\alpha',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b2', '\\beta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b3', '\\gamma',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b4', '\\delta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03f5', '\\epsilon',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b6', '\\zeta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b7', '\\eta', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b8', '\\theta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b9', '\\iota',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03ba', '\\kappa',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03bb', '\\lambda',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03bc', '\\mu', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03bd', '\\nu', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03be', '\\xi', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03bf', '\\omicron',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c0', '\\pi', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c1', '\\rho', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c3', '\\sigma',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c4', '\\tau', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c5', '\\upsilon',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03d5', '\\phi', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c7', '\\chi', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c8', '\\psi', acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c9', '\\omega',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03b5', '\\varepsilon',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03d1', '\\vartheta',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03d6', '\\varpi',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03f1', '\\varrho',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c2', '\\varsigma',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u03c6', '\\varphi',
      acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2217', '*');
  defineSymbol(math, main, bin, '+', '+');
  defineSymbol(math, main, bin, '\u2212', '-');
  defineSymbol(math, main, bin, '\u22c5', '\\cdot', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2218', '\\circ');
  defineSymbol(math, main, bin, '\u00f7', '\\div', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u00b1', '\\pm', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u00d7', '\\times', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2229', '\\cap', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u222a', '\\cup', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2216', '\\setminus');
  defineSymbol(math, main, bin, '\u2227', '\\land');
  defineSymbol(math, main, bin, '\u2228', '\\lor');
  defineSymbol(math, main, bin, '\u2227', '\\wedge', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2228', '\\vee', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u221a', '\\surd');
  defineSymbol(math, main, open, '(', '(');
  defineSymbol(math, main, open, '[', '[');
  defineSymbol(math, main, open, '\u27e8', '\\langle', acceptUnicodeChar: true);
  defineSymbol(math, main, open, '\u2223', '\\lvert');
  defineSymbol(math, main, open, '\u2225', '\\lVert');
  defineSymbol(math, main, close, ')', ')');
  defineSymbol(math, main, close, ']', ']');
  defineSymbol(math, main, close, '?', '?');
  defineSymbol(math, main, close, '!', '!');
  defineSymbol(math, main, close, '\u27e9', '\\rangle',
      acceptUnicodeChar: true);
  defineSymbol(math, main, close, '\u2223', '\\rvert');
  defineSymbol(math, main, close, '\u2225', '\\rVert');
  defineSymbol(math, main, rel, '=', '=');
  defineSymbol(math, main, rel, '<', '<');
  defineSymbol(math, main, rel, '>', '>');
  defineSymbol(math, main, rel, ':', ':');
  defineSymbol(math, main, rel, '\u2248', '\\approx', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2245', '\\cong', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2265', '\\ge');
  defineSymbol(math, main, rel, '\u2265', '\\geq', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2190', '\\gets');
  defineSymbol(math, main, rel, '>', '\\gt');
  defineSymbol(math, main, rel, '\u2208', '\\in', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\ue020', '\\@not');
  defineSymbol(math, main, rel, '\u2282', '\\subset', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2283', '\\supset', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2286', '\\subseteq',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2287', '\\supseteq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2288', '\\nsubseteq',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2289', '\\nsupseteq',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u22a8', '\\models');
  defineSymbol(math, main, rel, '\u2190', '\\leftarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2264', '\\le');
  defineSymbol(math, main, rel, '\u2264', '\\leq', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '<', '\\lt');
  defineSymbol(math, main, rel, '\u2192', '\\rightarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2192', '\\to');
  defineSymbol(math, ams, rel, '\u2271', '\\ngeq', acceptUnicodeChar: true);
  defineSymbol(math, ams, rel, '\u2270', '\\nleq', acceptUnicodeChar: true);
  defineSymbol(math, main, spacing, '\u00a0', '\\ ');
  defineSymbol(math, main, spacing, '\u00a0', '~');
  defineSymbol(math, main, spacing, '\u00a0', '\\space');
// Ref: LaTeX Source 2e: \DeclareRobustCommand{\nobreakspace}{%
  defineSymbol(math, main, spacing, '\u00a0', '\\nobreakspace');
  defineSymbol(text, main, spacing, '\u00a0', '\\ ');
  defineSymbol(text, main, spacing, '\u00a0', '~');
  defineSymbol(text, main, spacing, '\u00a0', '\\space');
  defineSymbol(text, main, spacing, '\u00a0', '\\nobreakspace');
  defineSymbol(math, main, spacing, null, '\\nobreak');
  defineSymbol(math, main, spacing, null, '\\allowbreak');
  defineSymbol(math, main, punct, ',', ',');
  defineSymbol(math, main, punct, ';', ';');
  defineSymbol(math, ams, bin, '\u22bc', '\\barwedge', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22bb', '\\veebar', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2299', '\\odot', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2295', '\\oplus', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2297', '\\otimes', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\u2202', '\\partial',
      acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u2298', '\\oslash', acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u229a', '\\circledcirc',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, bin, '\u22a1', '\\boxdot', acceptUnicodeChar: true);
  defineSymbol(math, main, bin, '\u25b3', '\\bigtriangleup');
  defineSymbol(math, main, bin, '\u25bd', '\\bigtriangledown');
  defineSymbol(math, main, bin, '\u2020', '\\dagger');
  defineSymbol(math, main, bin, '\u22c4', '\\diamond');
  defineSymbol(math, main, bin, '\u22c6', '\\star');
  defineSymbol(math, main, bin, '\u25c3', '\\triangleleft');
  defineSymbol(math, main, bin, '\u25b9', '\\triangleright');
  defineSymbol(math, main, open, '{', '\\{');
  defineSymbol(text, main, textord, '{', '\\{');
  defineSymbol(text, main, textord, '{', '\\textbraceleft');
  defineSymbol(math, main, close, '}', '\\}');
  defineSymbol(text, main, textord, '}', '\\}');
  defineSymbol(text, main, textord, '}', '\\textbraceright');
  defineSymbol(math, main, open, '{', '\\lbrace');
  defineSymbol(math, main, close, '}', '\\rbrace');
  defineSymbol(math, main, open, '[', '\\lbrack');
  defineSymbol(text, main, textord, '[', '\\lbrack');
  defineSymbol(math, main, close, ']', '\\rbrack');
  defineSymbol(text, main, textord, ']', '\\rbrack');
  defineSymbol(math, main, open, '(', '\\lparen');
  defineSymbol(math, main, close, ')', '\\rparen');
  defineSymbol(text, main, textord, '<', '\\textless'); // in T1 fontenc
  defineSymbol(text, main, textord, '>', '\\textgreater'); // in T1 fontenc
  defineSymbol(math, main, open, '\u230a', '\\lfloor', acceptUnicodeChar: true);
  defineSymbol(math, main, close, '\u230b', '\\rfloor',
      acceptUnicodeChar: true);
  defineSymbol(math, main, open, '\u2308', '\\lceil', acceptUnicodeChar: true);
  defineSymbol(math, main, close, '\u2309', '\\rceil', acceptUnicodeChar: true);
  defineSymbol(math, main, textord, '\\', '\\backslash');
  defineSymbol(math, main, textord, '\u2223', '|');
  defineSymbol(math, main, textord, '\u2223', '\\vert');
  defineSymbol(text, main, textord, '|', '\\textbar'); // in T1 fontenc
  defineSymbol(math, main, textord, '\u2225', '\\|');
  defineSymbol(math, main, textord, '\u2225', '\\Vert');
  defineSymbol(text, main, textord, '\u2225', '\\textbardbl');
  defineSymbol(text, main, textord, '~', '\\textasciitilde');
  defineSymbol(text, main, textord, '\\', '\\textbackslash');
  defineSymbol(text, main, textord, '^', '\\textasciicircum');
  defineSymbol(math, main, rel, '\u2191', '\\uparrow', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21d1', '\\Uparrow', acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2193', '\\downarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21d3', '\\Downarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u2195', '\\updownarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, rel, '\u21d5', '\\Updownarrow',
      acceptUnicodeChar: true);
  defineSymbol(math, main, op, '\u2210', '\\coprod');
  defineSymbol(math, main, op, '\u22c1', '\\bigvee');
  defineSymbol(math, main, op, '\u22c0', '\\bigwedge');
  defineSymbol(math, main, op, '\u2a04', '\\biguplus');
  defineSymbol(math, main, op, '\u22c2', '\\bigcap');
  defineSymbol(math, main, op, '\u22c3', '\\bigcup');
  defineSymbol(math, main, op, '\u222b', '\\int');
  defineSymbol(math, main, op, '\u222b', '\\intop');
  defineSymbol(math, main, op, '\u222c', '\\iint');
  defineSymbol(math, main, op, '\u222d', '\\iiint');
  defineSymbol(math, main, op, '\u220f', '\\prod');
  defineSymbol(math, main, op, '\u2211', '\\sum');
  defineSymbol(math, main, op, '\u2a02', '\\bigotimes');
  defineSymbol(math, main, op, '\u2a01', '\\bigoplus');
  defineSymbol(math, main, op, '\u2a00', '\\bigodot');
  defineSymbol(math, main, op, '\u222e', '\\oint');
  defineSymbol(math, main, op, '\u222f', '\\oiint');
  defineSymbol(math, main, op, '\u2230', '\\oiiint');
  defineSymbol(math, main, op, '\u2a06', '\\bigsqcup');
  defineSymbol(math, main, op, '\u222b', '\\smallint');
  defineSymbol(text, main, inner, '\u2026', '\\textellipsis');
  defineSymbol(math, main, inner, '\u2026', '\\mathellipsis');
  defineSymbol(text, main, inner, '\u2026', '\\ldots', acceptUnicodeChar: true);
  defineSymbol(math, main, inner, '\u2026', '\\ldots', acceptUnicodeChar: true);
  defineSymbol(math, main, inner, '\u22ef', '\\@cdots',
      acceptUnicodeChar: true);
  defineSymbol(math, main, inner, '\u22f1', '\\ddots', acceptUnicodeChar: true);
  defineSymbol(
      math, main, textord, '\u22ee', '\\varvdots'); // \vdots is a macro
  defineSymbol(math, main, accent, '\u02ca', '\\acute');
  defineSymbol(math, main, accent, '\u02cb', '\\grave');
  defineSymbol(math, main, accent, '\u00a8', '\\ddot');
  defineSymbol(math, main, accent, '\u007e', '\\tilde');
  defineSymbol(math, main, accent, '\u02c9', '\\bar');
  defineSymbol(math, main, accent, '\u02d8', '\\breve');
  defineSymbol(math, main, accent, '\u02c7', '\\check');
  defineSymbol(math, main, accent, '\u005e', '\\hat');
  defineSymbol(math, main, accent, '\u20d7', '\\vec');
  defineSymbol(math, main, accent, '\u02d9', '\\dot');
  defineSymbol(math, main, accent, '\u02da', '\\mathring');
  defineSymbol(math, main, mathord, '\u0131', '\\imath',
      acceptUnicodeChar: true);
  defineSymbol(math, main, mathord, '\u0237', '\\jmath',
      acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u0131', '\\i', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u0237', '\\j', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00df', '\\ss', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00e6', '\\ae', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00e6', '\\ae', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u0153', '\\oe', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00f8', '\\o', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00c6', '\\AE', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u0152', '\\OE', acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00d8', '\\O', acceptUnicodeChar: true);
  defineSymbol(text, main, accent, '\u02ca', "\\'"); // acute
  defineSymbol(text, main, accent, '\u02cb', '\\`'); // grave
  defineSymbol(text, main, accent, '\u02c6', '\\^'); // circumflex
  defineSymbol(text, main, accent, '\u02dc', '\\~'); // tilde
  defineSymbol(text, main, accent, '\u02c9', '\\='); // macron
  defineSymbol(text, main, accent, '\u02d8', '\\u'); // breve
  defineSymbol(text, main, accent, '\u02d9', '\\.'); // dot above
  defineSymbol(text, main, accent, '\u02da', '\\r'); // ring above
  defineSymbol(text, main, accent, '\u02c7', '\\v'); // caron
  defineSymbol(text, main, accent, '\u00a8', "\\'"); // diaresis
  defineSymbol(text, main, accent, '\u02dd', '\\H'); // double acute
  defineSymbol(text, main, accent, '\u25ef', '\\textcircled'); // \bigcirc glyph

// These ligatures are detected and created in Parser.js's `formLigatures`.

  defineSymbol(text, main, textord, '\u2013', '--');
  defineSymbol(text, main, textord, '\u2013', '\\textendash');
  defineSymbol(text, main, textord, '\u2014', '---');
  defineSymbol(text, main, textord, '\u2014', '\\textemdash');
  defineSymbol(text, main, textord, '\u2018', '`');
  defineSymbol(text, main, textord, '\u2018', '\\textquoteleft');
  defineSymbol(text, main, textord, '\u2019', "'");
  defineSymbol(text, main, textord, '\u2019', '\\textquoteright');
  defineSymbol(text, main, textord, '\u201c', '``');
  defineSymbol(text, main, textord, '\u201c', '\\textquotedblleft');
  defineSymbol(text, main, textord, '\u201d', "''");
  defineSymbol(text, main, textord, '\u201d', '\\textquotedblright');
//  \degree from gensymb package
  defineSymbol(math, main, textord, '\u00b0', '\\degree',
      acceptUnicodeChar: true);
  defineSymbol(text, main, textord, '\u00b0', '\\degree');
// \textdegree from inputenc package
  defineSymbol(text, main, textord, '\u00b0', '\\textdegree',
      acceptUnicodeChar: true);
// TODO: In LaTeX, \pounds can generate a different character in text and math
// mode, but among our fonts, only Main-Italic defines this character '163'.
  defineSymbol(math, main, mathord, '\u00a3', '\\pounds');
  defineSymbol(math, main, mathord, '\u00a3', '\\mathsterling',
      acceptUnicodeChar: true);
  defineSymbol(text, main, mathord, '\u00a3', '\\pounds');
  defineSymbol(text, main, mathord, '\u00a3', '\\textsterling',
      acceptUnicodeChar: true);
  defineSymbol(math, ams, textord, '\u2720', '\\maltese');
  defineSymbol(text, ams, textord, '\u2720', '\\maltese');

  defineSymbol(text, main, spacing, '\u00a0', '\\ ');
  defineSymbol(text, main, spacing, '\u00a0', ' ');
  defineSymbol(text, main, spacing, '\u00a0', '~');

// There are lots of symbols which are the same, so we add them in afterwards.
// All of these are textords in math mode
  const mathTextSymbols = '0123456789/@.\'';
  for (var i = 0; i < mathTextSymbols.length; i++) {
    final ch = mathTextSymbols[i];
    defineSymbol(math, main, textord, ch, ch);
  }

// All of these are textords in text mode
  const textSymbols = '0123456789!@*()-=+[]<>|\';:?/.,';
  for (var i = 0; i < textSymbols.length; i++) {
    final ch = textSymbols[i];
    defineSymbol(text, main, textord, ch, ch);
  }

// All of these are textords in text mode, and mathords in math mode
  const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  for (var i = 0; i < letters.length; i++) {
    final ch = letters[i];
    defineSymbol(math, main, mathord, ch, ch);
    defineSymbol(text, main, textord, ch, ch);
  }

// Blackboard bold and script letters in Unicode range
  defineSymbol(math, ams, textord, 'C', '\u2102'); // blackboard bold
  defineSymbol(text, ams, textord, 'C', '\u2102');
  defineSymbol(math, ams, textord, 'H', '\u210D');
  defineSymbol(text, ams, textord, 'H', '\u210D');
  defineSymbol(math, ams, textord, 'N', '\u2115');
  defineSymbol(text, ams, textord, 'N', '\u2115');
  defineSymbol(math, ams, textord, 'P', '\u2119');
  defineSymbol(text, ams, textord, 'P', '\u2119');
  defineSymbol(math, ams, textord, 'Q', '\u211A');
  defineSymbol(text, ams, textord, 'Q', '\u211A');
  defineSymbol(math, ams, textord, 'R', '\u211D');
  defineSymbol(text, ams, textord, 'R', '\u211D');
  defineSymbol(math, ams, textord, 'Z', '\u2124');
  defineSymbol(text, ams, textord, 'Z', '\u2124');
  defineSymbol(math, main, mathord, 'h', '\u210E'); // italic h, Planck constant
  defineSymbol(text, main, mathord, 'h', '\u210E');

// The next loop loads wide (surrogate pair) characters.
// We support some letters in the Unicode range U+1D400 to U+1D7FF,
// Mathematical Alphanumeric Symbols.
// Some editors do not deal well with wide characters. So don't write the
// string into this file. Instead, create the string from the surrogate pair.
  var wideChar = '';
  for (var i = 0; i < letters.length; i++) {
    final ch = letters[i];

    // The hex numbers in the next line are a surrogate pair.
    // 0xD835 is the high surrogate for all letters in the range we support.
    // 0xDC00 is the low surrogate for bold A.
    wideChar = String.fromCharCodes([0xD835, 0xDC00 + i]); // A-Z a-z bold
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDC34 + i]); // A-Z a-z italic
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar =
        String.fromCharCodes([0xD835, 0xDC68 + i]); // A-Z a-z bold italic
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDD04 + i]); // A-Z a-z Fractur
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDDA0 + i]); // A-Z a-z sans-serif
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDDD4 + i]); // A-Z a-z sans bold
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar =
        String.fromCharCodes([0xD835, 0xDE08 + i]); // A-Z a-z sans italic
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDE70 + i]); // A-Z a-z monospace
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    if (i < 26) {
      // KaTeX fonts have only capital letters for blackboard bold and script.
      // See exception for k below.
      wideChar =
          String.fromCharCodes([0xD835, 0xDD38 + i]); // A-Z double struck
      defineSymbol(math, main, mathord, ch, wideChar);
      defineSymbol(text, main, textord, ch, wideChar);

      wideChar = String.fromCharCodes([0xD835, 0xDC9C + i]); // A-Z script
      defineSymbol(math, main, mathord, ch, wideChar);
      defineSymbol(text, main, textord, ch, wideChar);
    }

    // TODO: Add bold script when it is supported by a KaTeX font.
  }
// 'k' is the only double struck lower case letter in the KaTeX fonts.
  wideChar = String.fromCharCodes([0xD835, 0xDD5C]); // k double struck
  defineSymbol(math, main, mathord, 'k', wideChar);
  defineSymbol(text, main, textord, 'k', wideChar);

// Next, some wide character numerals
  for (var i = 0; i < 10; i++) {
    final ch = i.toString();

    wideChar = String.fromCharCodes([0xD835, 0xDFCE + i]); // 0-9 bold
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDFE2 + i]); // 0-9 sans serif
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDFEC + i]); // 0-9 bold sans
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);

    wideChar = String.fromCharCodes([0xD835, 0xDFF6 + i]); // 0-9 monospace
    defineSymbol(math, main, mathord, ch, wideChar);
    defineSymbol(text, main, textord, ch, wideChar);
  }

// We add these Latin-1 letters as symbols for backwards-compatibility,
// but they are not actually in the font, nor are they supported by the
// Unicode accent mechanism, so they fall back to Times font and look ugly.
// TODO(edemaine): Fix this.
  const extraLatin = 'ÇÐÞçþ';
  for (var i = 0; i < extraLatin.length; i++) {
    final ch = extraLatin[i];
    defineSymbol(math, main, mathord, ch, ch);
    defineSymbol(text, main, textord, ch, ch);
  }
  defineSymbol(text, main, textord, 'ð', 'ð');

// Unicode versions of existing characters
  defineSymbol(text, main, textord, '\u2013', '–');
  defineSymbol(text, main, textord, '\u2014', '—');
  defineSymbol(text, main, textord, '\u2018', '‘');
  defineSymbol(text, main, textord, '\u2019', '’');
  defineSymbol(text, main, textord, '\u201c', '“');
  defineSymbol(text, main, textord, '\u201d', '”');
}

const ligatures = {
  '--': true,
  '---': true,
  '``': true,
  "''": true,
};
