import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum AppTextFieldType { text, email, password, multiline }

class AppTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final String? errorText;
  final AppTextFieldType type;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final int? maxLines;
  final int? maxLength;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.errorText,
    this.type = AppTextFieldType.text,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
    this.maxLines,
    this.maxLength,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.neutral900,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.type == AppTextFieldType.password && _obscureText,
          maxLines: widget.type == AppTextFieldType.multiline ? (widget.maxLines ?? 3) : 1,
          maxLength: widget.maxLength,
          keyboardType: _getKeyboardType(),
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            filled: true,
            fillColor: AppColors.neutral100,
            suffixIcon: widget.type == AppTextFieldType.password
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.neutral500,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary500),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case AppTextFieldType.email:
        return TextInputType.emailAddress;
      case AppTextFieldType.multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }
} 