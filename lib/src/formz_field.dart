import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

typedef FormzFieldBuilder = Widget Function(FormzFieldState field);

class FormzField extends StatefulWidget {
  const FormzField({
    super.key,
    required this.builder,
    required this.formzInput,
    this.onChanged,
  });

  final FormzFieldBuilder builder;
  final FormzInput<String, dynamic> formzInput;
  final ValueChanged<String>? onChanged;

  @override
  State<FormzField> createState() => FormzFieldState();
}

class FormzFieldState extends State<FormzField> {
  late final TextEditingController controller;
  String? _previousValue;

  @override
  void didUpdateWidget(FormzField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (controller.text != widget.formzInput.value) {
      controller.text = widget.formzInput.value;
    }
  }

  void _updateOnChanged() {
    if (widget.onChanged != null) {
      if (controller.text != widget.formzInput.value &&
          controller.text != _previousValue) {
        _previousValue = controller.text;
        widget.onChanged?.call(controller.text);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.formzInput.value);
    if (widget.onChanged != null) {
      controller.addListener(_updateOnChanged);
    }
  }

  @override
  void dispose() {
    controller.removeListener(_updateOnChanged);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(this);
  }
}
