import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BeautyTextField extends StatefulWidget {
  /// TR
  ///
  /// [BeautyTextField] Widget temasi icin 'themeColor' veya 'materialColor' parametresi kullanabilirsiniz. Ancak yalnizca bir parametre kabul edilmektedir. Aksi halde hata firlatacaktir.
  ///
  /// Eger [Color] sinifindan tanimladiginiz ozel bir renk varsa [MaterialColor]'a generate yapabilir veya 'themeColor' parametresini kullanabilirsiniz.
  ///
  /// Bu widget icin siddetle 'materialColor' parametresi onerilmektedir fakat [MaterialColor] tanimlamayi bilmiyor veya bunun için zamaniniz yoksa 'themeColor' parametresini kullanabilirsiniz.
  ///
  ///
  /// EN
  ///
  /// [BeautyTextField] You can use 'themeColor' or 'materialColor' parameter for widget theme. However, only one parameter is accepted. Otherwise, it will throw an error (exception).
  ///
  /// If there is a special color that you defined from the [Color] class, you can generate [MaterialColor] or use the 'themeColor' parameter.
  ///
  /// The 'materialColor' parameter is strongly recommended for this widget, but you can use the 'themeColor' paramaeter in case of you don't know how to define [MaterialColor] or don't have time for it.

  const BeautyTextField({
    Key? key,
    required this.text,
    required this.isNumber,
    this.onTap,
    this.onChanged,
    this.themeColor,
    this.cursorColor,
    this.hintText,
    this.textController,
    this.textFieldColor,
    this.maxLength,
    this.materialColor,
    this.prefixIconData,
  }) : super(key: key);

  final String text;
  final bool isNumber;
  final Color? themeColor;
  final String? hintText;
  final Color? cursorColor;
  final TextEditingController? textController;
  final Color? textFieldColor;
  final int? maxLength;
  final IconData? prefixIconData;
  final MaterialColor? materialColor;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  State<BeautyTextField> createState() => _BeautyTextFieldState();
}

class _BeautyTextFieldState extends State<BeautyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: getColor(ColorType.THEME_COLOR),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                color: getColor(ColorType.FRONT_COLOR),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: widget.textFieldColor ?? Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                cursorColor: widget.cursorColor ?? getColor(ColorType.FRONT_COLOR),
                textInputAction: TextInputAction.next,
                maxLength: widget.maxLength,
                controller: widget.textController,
                inputFormatters: widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))] : null,
                keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: widget.prefixIconData != null
                      ? Icon(
                          widget.prefixIconData,
                          color: getColor(ColorType.ICON_COLOR),
                        )
                      : null,
                  counterText: "",
                  border: InputBorder.none,
                  hintText: widget.hintText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color? getColor(ColorType colorType) {
    if (widget.themeColor != null && widget.materialColor != null) {
      throw Exception("'themeColor' veya 'materialColor' parametrelerinden yalnızca biri kullanılmalıdır");
    } else if (widget.themeColor == null && widget.materialColor == null) {
      throw Exception("'themeColor' veya 'materialColor' parametrelerinin her ikisi boş bırakılamaz");
    } else if (widget.themeColor == null && widget.materialColor != null) {
      return colorType == ColorType.THEME_COLOR
          ? widget.materialColor![100]
          : colorType == ColorType.FRONT_COLOR
              ? widget.materialColor![900]
              : widget.materialColor![300];
    } else {
      return colorType == ColorType.THEME_COLOR
          ? widget.themeColor!.withOpacity(0.3)
          : colorType == ColorType.FRONT_COLOR
              ? widget.themeColor!.withOpacity(1)
              : widget.themeColor!.withOpacity(0.7);
    }
  }
}

enum ColorType { ICON_COLOR, THEME_COLOR, FRONT_COLOR }

/// ORNEK BIR [MaterialColor] SEMASI
/// THIS IS AN EXAMPLE [MaterialColor] SCHEME

const int _ornekRenk = 0xFFCC0000;
const MaterialColor ornekMaterial = MaterialColor(_ornekRenk, <int, Color>{
  50: Color(0xFFF9E0E0),
  100: Color(0xFFF0B3B3),
  200: Color(0xFFE68080),
  300: Color(0xFFDB4D4D),
  400: Color(0xFFD42626),
  500: Color(_ornekRenk),
  600: Color(0xFFC70000),
  700: Color(0xFFC00000),
  800: Color(0xFFB90000),
  900: Color(0xFFAD0000),
});
