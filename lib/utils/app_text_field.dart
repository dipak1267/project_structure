import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_color.dart';

// ignore: must_be_immutable
class AppTextFields extends StatefulWidget {
  AppTextFields({
    Key? key,
    required this.controller,
    required this.hintText,
    this.trailing,
    this.maxLine,
    this.isSecureEntry = false,
    this.readOnly = false,
    this.shoeCursor = true,
    this.hintStyle,
    this.leading,
    this.onTap,
    this.textInputAction,
    this.isPasswordField,
    this.onChange,
    this.fillColor,
    this.textInputType,
    this.suffixIcon,
    this.validator
  }) : super(key: key);
  TextEditingController controller;
  String hintText;
  bool isSecureEntry;
  bool readOnly;
  bool shoeCursor;
  IconData? leading;
  Widget? trailing;
  Color? fillColor;
  TextStyle? hintStyle;
  Function()? onTap;
  Function(String)? onChange;
  Widget? suffixIcon;
  bool? isPasswordField = false;
  TextInputAction?textInputAction;
  TextInputType? textInputType;

  int? maxLine;
  final FormFieldValidator<String>? validator;

  @override
  State<AppTextFields> createState() => _AppTextFieldsState();
}

bool show = true;

class _AppTextFieldsState extends State<AppTextFields> {
  FocusNode _focusNode = FocusNode();
  bool _isFocus = false;

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocus = _focusNode.hasFocus;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget.validator,
      maxLines: widget.isSecureEntry ? 1 : widget.maxLine ?? 1,
      cursorColor: Colors.black,
      focusNode: _focusNode,
      controller: widget.controller,
      textInputAction:widget.textInputAction?? TextInputAction.next,
      keyboardType:widget.textInputType,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(widget.leading,
              color: _isFocus
                  ? primaryColor
                  : hintTextColor ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          fillColor: _isFocus ? lightPrimaryColor : lightGreyColor,
          suffixIcon: widget.isSecureEntry
              ? InkWell(
                onTap: () {
              setState(() {
                show = !show;
              });
            },
                child: Icon(
              show ? Icons.visibility_off_outlined :  Icons.visibility_outlined,
              color: _isFocus
                  ? primaryColor
                  : hintTextColor,
            ).paddingOnly(right: 12, bottom: 12, top: 12),
          )
              : widget.trailing != null
              ? Padding(
            padding: const EdgeInsets.only(
                right: 12, bottom: 12, top: 12),
            child: widget.trailing,
          )
              : null,
          // suffixIcon: widget.isPasswordField == true ? widget.suffixIcon : const SizedBox(),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
               TextStyle(
                  color: _isFocus
                      ? primaryColor
                      :hintTextColor,
                  fontSize: 14,
                  fontFamily: 'SofiaSans',
                  fontWeight: FontWeight.w500),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(106),
          borderSide:  const BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(106),
          borderSide: const BorderSide(color: Colors.red, width: 1.0
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(106),
          borderSide: const BorderSide(color: Colors.transparent, width: 1.0
          ),
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(106),
          borderSide:  const BorderSide(
            width: 1,
           color: lightGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(106),
          borderSide:  const BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),

      ),
      style: TextStyle(
          color:  _isFocus
              ? primaryColor
              :hintTextColor,
          fontSize: 16,
          fontFamily: 'SofiaSans',
          fontWeight: FontWeight.w500),
      onChanged:widget.onChange??(val){},
      readOnly:widget.readOnly,
      showCursor: widget.shoeCursor,
      obscureText: widget.isSecureEntry ? show : false,
      onTap: widget.onTap,
    );
  }
}



