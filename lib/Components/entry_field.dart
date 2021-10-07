//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryField extends StatefulWidget {
  final String hint;
  final Function onEditingComplete;
  final IconData prefixIcon;
  final Color color;
  final TextEditingController controller;
  final String initialValue;
  final bool readOnly;
  final TextAlign textAlign;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final String label;
  final int maxLines;
  final TextInputFormatter textInputFormatter;
  final Function onTap;
  final IconData suffix;
  final validator;
  final bool obSecure;
  final bool isDense;
  EntryField({
    this.onEditingComplete,
    this.hint,
    this.obSecure,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.label,
    this.maxLines,
    this.textInputFormatter,
    this.onTap,
    this.suffix,
    this.validator,
    this.isDense,
  });

  @override
  _EntryFieldState createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  bool obSecureText;
  @override
  void initState() {
// TODO: implement initState
    obSecureText = widget.obSecure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.label != null
            ? Text('\n' + widget.label + '\n',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Theme.of(context).disabledColor))
            : SizedBox.shrink(),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                inputFormatters: [
                  widget.textInputFormatter == null
                      ? LengthLimitingTextInputFormatter(300)
                      : widget.textInputFormatter
                ],
                obscureText: obSecureText,
                validator: widget.validator,
                controller: widget.controller,
                initialValue: widget.initialValue,
                readOnly: widget.readOnly ?? false,
                maxLines: widget.maxLines ?? 1,
                textAlign: widget.textAlign ?? TextAlign.left,
                keyboardType: widget.textInputType,
                onEditingComplete: widget.onEditingComplete,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
// prefixIcon: Icon(widget.prefixIcon,
//     color: Theme.of(context).primaryColor),
                  suffixIcon: InkWell(
                    child: Icon(widget.suffixIcon),
                    onTap: () {
                      if (widget.obSecure) {
                        setState(() {
                          obSecureText = !obSecureText;
                        });
                      }
                    },
                  ),
                  labelText: widget.hint,
                  filled: true,
                  fillColor: widget.color ?? Theme.of(context).backgroundColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                ),
                onTap: widget.onTap as void Function(),
              ),
            ),
            if (widget.suffix != null)
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 8),
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    widget.suffix,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
