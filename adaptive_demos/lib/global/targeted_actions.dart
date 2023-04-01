import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// Provides a top level scope of targeted actions
/// Targeted actions are useful for making actions that are bound to children or
/// siblings of the focused widget available for invocation that wouldn't
/// normally be visible to a Shortcuts widget ancestor of the focused widget.
/// TargetedActionScope is used in place or in addition to the Shortcuts widget
/// that defines the key bindings for a subtree.
///
/// To use a targeted action, define this scope with a set of shortcuts that
/// should be active in this scope. Then, in a child widget of this one, define
/// a [TargetedActionBinding] with the actions that you wish to execute when the
/// binding is activated with the intent. If no action is defined for a scope
/// for that intent, then nothing happens.

class TargetedActionScope extends StatefulWidget {
  TargetedActionScope({Key? key, required this.child, required this.shortcuts})
      : super(key: key);

  final Widget child;
  final Map<LogicalKeySet, Intent> shortcuts;

  @override
  State<TargetedActionScope> createState() => _TargetedActionScopeState();
}

class _TargetedActionScopeState extends State<TargetedActionScope> {
  late _TargetedActionRegistry registry;
  Map<LogicalKeySet, Intent> mappedShortcuts = <LogicalKeySet, Intent>{};

  @override
  void initState() {
    super.initState();
    registry = _TargetedActionRegistry();
    mappedShortcuts = _buildShortcuts();
  }

  @override
  void didUpdateWidget(TargetedActionScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.shortcuts != widget.shortcuts) {
      mappedShortcuts = _buildShortcuts();
    }
  }

  Map<LogicalKeySet, Intent> _buildShortcuts() {
    Map<LogicalKeySet, Intent> mapped = <LogicalKeySet, Intent>{};
    for (final LogicalKeySet activator in widget.shortcuts.keys) {
      mapped[activator] = _TargetedIntent(widget.shortcuts[activator]!);
    }
    return mapped;
  }

  @override
  Widget build(BuildContext context) {
    return Provider<_TargetedActionRegistry>.value(
      value: registry,
      child: Shortcuts(
          shortcuts: mappedShortcuts,
          child: Actions(
            actions: <Type, Action<Intent>>{
              _TargetedIntent: _TargetedAction(registry),
            },
            child: widget.child,
          )),
    );
  }
}

class TargetedActionBinding extends StatefulWidget {
  TargetedActionBinding({Key? key, required this.child, this.actions})
      : super(key: key);

  final Widget child;
  final Map<Type, Action<Intent>>? actions;

  @override
  State<TargetedActionBinding> createState() => _TargetedActionBindingState();
}

class _TargetedActionBindingState extends State<TargetedActionBinding> {
  final GlobalKey _subtreeKey =
      GlobalKey(debugLabel: 'Targeted Action Binding');

  @override
  Widget build(BuildContext context) {
    Provider.of<_TargetedActionRegistry>(context).addTarget(_subtreeKey);
    Widget result = KeyedSubtree(
      key: _subtreeKey,
      child: this.widget.child,
    );
    if (widget.actions != null) {
      result = Actions(actions: widget.actions!, child: result);
    }
    return result;
  }

  @override
  void deactivate() {
    Provider.of<_TargetedActionRegistry>(context, listen: false)
        .targetKeys
        .remove(_subtreeKey);
    super.deactivate();
  }
}

class _TargetedActionRegistry {
  _TargetedActionRegistry() : targetKeys = <GlobalKey>{};

  Set<GlobalKey> targetKeys;

  void addTarget(GlobalKey target) {
    targetKeys.add(target);
  }

  bool isEnabled(Intent intent) {
    for (GlobalKey key in targetKeys) {
      if (key.currentContext != null) {
        Action? foundAction =
            Actions.maybeFind<Intent>(key.currentContext!, intent: intent);
        if (foundAction != null && foundAction.isEnabled(intent)) {
          return true;
        }
      }
    }
    return false;
  }

  Object? invoke(Intent intent) {
    for (GlobalKey key in targetKeys) {
      if (key.currentContext != null) {
        if (Actions.maybeFind<Intent>(key.currentContext!, intent: intent) !=
            null) {
          return Actions.invoke(key.currentContext!, intent);
        }
      }
    }
    return null;
  }
}

class _TargetedIntent extends Intent {
  const _TargetedIntent(this.intent);

  final Intent intent;
}

class _TargetedAction extends Action<_TargetedIntent> {
  _TargetedAction(this.registry);

  final _TargetedActionRegistry registry;

  @override
  bool isEnabled(_TargetedIntent intent) {
    return registry.isEnabled(intent.intent);
  }

  @override
  Object? invoke(covariant _TargetedIntent intent) {
    registry.invoke(intent.intent);
  }
}
