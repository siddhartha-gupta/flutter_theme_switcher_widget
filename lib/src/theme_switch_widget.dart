import 'package:flutter/material.dart';
import 'custom_switch_widget.dart';

class ThemeSwitchWidget extends StatefulWidget {
  final Function(String val) handleThemeSelection;
  final String selectedTheme;

  ThemeSwitchWidget({
    Key key,
    @required this.handleThemeSelection,
    @required this.selectedTheme,
  }) : super(key: key);

  @override
  ThemeSwitchWidgetState createState() => ThemeSwitchWidgetState();
}

class ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  String selectedTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  themeChanged(bool nightMode) {
    String value = nightMode ? 'dark' : 'light';

    setState(() {
      selectedTheme = value;
    });
    widget.handleThemeSelection(value);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (Theme.of(context).brightness == Brightness.dark) {
        selectedTheme = 'dark';
      } else {
        selectedTheme = 'light';
      }
    });

    return new Container(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Choose your style',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              CustomSwitchWidget(
                value: widget.selectedTheme == 'dark' ? true : false,
                onChanged: (bool val) {
                  themeChanged(val);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
