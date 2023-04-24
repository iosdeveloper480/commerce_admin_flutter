import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/material.dart';

class WATextFormField extends StatefulWidget {
  const WATextFormField({
    Key? key,
    required this.hintText,
    required this.label,
    this.keyboardType = TextInputType.name,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.onSaved,
  }) : super(key: key);

  final String hintText;
  final String label;
  final TextInputType keyboardType;

  final FallbackFunction<String>? onChanged;
  final Fallback0Param? onTap;
  final FallbackFunction<String>? onFieldSubmitted;
  final FallbackFunction<String?>? onSaved;

  @override
  State<WATextFormField> createState() => _WATextFormFieldState();
}

class _WATextFormFieldState extends State<WATextFormField> {
  onTapOutSide(BuildContext context, PointerDownEvent event) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        keyboardAppearance: Brightness.dark,
        textInputAction: TextInputAction.next,
        enableSuggestions: false,
        maxLines: null,
        expands: true,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onTapOutside: (PointerDownEvent event) {
          onTapOutSide(context, event);
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: CustomColors.primary,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          hintText: widget.hintText,
          label: Text(widget.label),
        ),
      ),
    );
  }
}
