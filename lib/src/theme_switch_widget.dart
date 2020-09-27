import 'package:flutter/material.dart';
import 'custom_switch_widget.dart';

class ThemeSwitchWidget extends StatefulWidget {
  final Function(bool val) handleThemeSelection;
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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.handleThemeSelection(val);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
