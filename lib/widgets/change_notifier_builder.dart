import 'package:flutter/material.dart';


typedef Widget ChangeNotifierWidgetBuilder<T extends ChangeNotifier>(
    BuildContext context, T value);

class ChangeNotifierBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final ChangeNotifierWidgetBuilder<T> builder;

  final T value;

  const ChangeNotifierBuilder({
    Key key,
    @required this.builder,
    @required this.value,
  }) : super(key: key);

  @override
  _ChangeNotifierBuilderState<T> createState() =>
      _ChangeNotifierBuilderState<T>();
}

class _ChangeNotifierBuilderState<T extends ChangeNotifier>
    extends State<ChangeNotifierBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.value.addListener(_onChange);
  }

  @override
  void dispose() {
    widget.value.removeListener(_onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.value);
  }

  void _onChange() {
    if (mounted) {
      setState(() {});
    }
  }
}
