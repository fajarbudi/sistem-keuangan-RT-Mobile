import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keuangan_rt/base/helper.dart';

Widget gapX(BuildContext context, double persen) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * (persen / 100),
  );
}

Widget gapY(BuildContext context, double persen) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * (persen / 100),
  );
}

Widget gapXconstrain(BoxConstraints constraints, double persen) {
  return SizedBox(
    width: constraints.maxWidth * (persen / 100),
  );
}

Widget gapYconstrain(BoxConstraints constraints, double persen) {
  return SizedBox(
    height: constraints.maxHeight * (persen / 100),
  );
}

Widget inputText(BuildContext context,
    {Color fillColor = Colors.blue,
    Color borderColor = Colors.blue,
    Color textColor = Colors.black54,
    IconData icons = Icons.access_time,
    TextEditingController? controller,
    String label = 'Label',
    double width = 400,
    double height = 50}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextField(
      maxLines: null,
      expands: true,
      controller: controller,
      decoration: InputDecoration(
          floatingLabelStyle:
              baseFont(context, fontSize: 17, textColor: textColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor)),
          filled: true,
          fillColor: fillColor,
          suffixIcon: Icon(
            icons,
            color: textColor,
          ),
          labelText: label,
          labelStyle: baseFont(context)),
    ),
  );
}

Widget buttonIcon(BuildContext context, Function fungsi,
    {double width = 400,
    double height = 50,
    double borderRadius = 10,
    Color backgroundColor = Colors.blue,
    IconData icon = Icons.add_to_home_screen,
    Color iconColor = Colors.white,
    Color textColor = Colors.white,
    double fontSize = 1.8,
    String label = 'Button'}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: backgroundColor),
      onPressed: () => fungsi(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: fontSize,
          ),
          gapX(context, 1),
          // text(context, label, fontSize: fontSize, textColor: textColor)
          Text(
            label,
            style: baseFont(context, fontSize: fontSize, textColor: textColor),
          )
        ],
      ));
}

Widget divider(BuildContext context,
    {double height = 1, Color color = Colors.black45}) {
  return Container(
    color: color,
    width: double.infinity,
    height: height,
  );
}

Widget text(BuildContext context, String text,
    {double fontSize = 15, Color textColor = Colors.black54}) {
  return Text(
    text,
    style: baseFont(context, fontSize: fontSize, textColor: textColor),
    // style: TextStyle(color: textColor, fontSize: fontSize),
  );
}

TextStyle baseFont(BuildContext context,
    {double fontSize = 15, Color textColor = Colors.black54}) {
  return GoogleFonts.openSans(fontSize: fontSize, color: textColor);
}

SnackBar snackbar(
    BuildContext context, IconData icon, Color iconColor, String title) {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.all(5),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 120, left: 10, right: 10),
    backgroundColor: Colors.transparent,
    content: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 2,
                  offset: Offset(3, 4),
                  // spreadRadius: 5,
                  blurStyle: BlurStyle.solid)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapX(context, 2),
            Icon(icon, size: 50, color: iconColor),
            gapX(context, 2),
            Expanded(
              child: text(
                context,
                title,
              ),
            ),
          ],
        )),
  );
}
