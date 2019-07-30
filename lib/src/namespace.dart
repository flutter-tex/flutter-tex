import 'error.dart';

class Namespace<Value> {
  Namespace({this.builtins = const {}, this.current = const {}});

  final Map<String, Value> current;
  final Map<String, Value> builtins;
  final List<Map<String, Value>> undefStack = [];

  void beginGroup() {
    undefStack.add({});
  }

  void endGroup() {
    if (undefStack.isEmpty) {
      throw ParseError(
          message:
              'Unbalanced namespace destruction: attempt to pop global namespace; please report this as a bug');
    }
    final undefs = undefStack.removeLast();
    for (final undef in undefs.keys) {
      if (undefs[undef] != null) {
        current[undef] = undefs[undef];
      }
    }
  }

  bool has(String name) {
    return current.containsKey(name) || builtins.containsKey(name);
  }

  Value get(String name) {
    if (current.containsKey(name)) {
      return current[name];
    } else {
      return builtins[name];
    }
  }

  void set(String name, Value value, {bool global = false}) {
    if (global) {
      // Global set is equivalent to setting in all groups.  Simulate this
      // by destroying any undos currently scheduled for this name,
      // and adding an undo with the *new* value (in case it later gets
      // locally reset within this environment).
      for (var i = 0; i < undefStack.length; i++) {
        undefStack[i].remove(name);
      }
      if (undefStack.isNotEmpty) {
        undefStack[undefStack.length - 1][name] = value;
      }
    } else {
      // Undo this set at end of this group (possibly to `undefined`),
      // unless an undo is already in place, in which case that older
      // value is the correct one.
      final top = undefStack[undefStack.length - 1];
      if (top != null && !top.containsKey(name)) {
        top[name] = current[name];
      }
    }
    current[name] = value;
  }
}
