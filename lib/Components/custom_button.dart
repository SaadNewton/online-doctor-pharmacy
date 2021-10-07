import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;

  CustomButton({
    this.label,
    this.icon,
    this.iconGap,
    this.onTap,
    this.color,
    this.textColor,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8),
          color: color ?? theme.primaryColor,
        ),
        padding: EdgeInsets.all(padding ?? (icon != null ? 16.0 : 18.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox.shrink(),
            // icon != null ? SizedBox(width: iconGap ?? 12) : SizedBox.shrink(),
            Expanded(
              child: Text(
                label ?? AppLocalizations.of(context)!.continuee!,
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor ?? theme.backgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
