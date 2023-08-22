
import 'package:flutter/material.dart';
import 'package:my_application/models/themes_data.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:provider/provider.dart';

class CustomThemeWidget extends StatefulWidget {
  const CustomThemeWidget({super.key});

  @override
  State<CustomThemeWidget> createState() => _CustomThemeWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CustomThemeWidgetState extends State<CustomThemeWidget> {

  Widget customRadioButton(Color color, int index) {
    int value = Provider.of<ThemesData>(context).themeNumber;
    return InkWell(
      onTap: (){
        setState(() {
          value = index;
          Provider.of<ThemesData>(context, listen: false).whichThemes(value);
        });

      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 40) / 9,
        height: MediaQuery.of(context).size.width / 9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          // borderSide:
          border: Border.all(
              width: 3, color: (value == index) ? Colors.white : color),
        ),
        child: Icon(Icons.check,color: (value == index) ? Colors.green : color),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customRadioButton(AppColorConstants.primaryRed, 1),
          customRadioButton(AppColorConstants.primaryOrange, 2),
          customRadioButton(AppColorConstants.primaryYellow, 3),
          customRadioButton(AppColorConstants.primaryGreen, 4),
          customRadioButton(AppColorConstants.primaryBlue, 5),
          customRadioButton(AppColorConstants.primaryPurple, 6),
          customRadioButton(AppColorConstants.primaryPink, 7),
          customRadioButton(AppColorConstants.primaryLight, 8),
          customRadioButton(AppColorConstants.primaryDark, 9),
        ],
      ),
    );
  }
}
