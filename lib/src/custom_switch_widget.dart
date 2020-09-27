import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitchWidget({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  CustomSwitchWidgetState createState() => CustomSwitchWidgetState();
}

class CustomSwitchWidgetState extends State<CustomSwitchWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _circleAnimation;
  bool value;
  final double height = 40.0;
  final BorderRadius borderRadius = new BorderRadius.all(
    Radius.elliptical(40, 40),
  );

  @override
  void initState() {
    super.initState();

    value = widget.value;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 60,
      ),
    );
    _circleAnimation = AlignmentTween(
      begin: value ? Alignment.centerRight : Alignment.centerLeft,
      end: value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  onSwitched() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      widget.onChanged(!value);
      value = !value;
    });
  }

  Widget dayButton() {
    if (value) {
      return Container(
        width: 60.0,
        height: height,
        child: Center(
          child: Text(
            'DAY',
            style: new TextStyle(
              color: Color(0xffb9b9b9),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 60.0,
        height: height,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'DAY',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }
  }

  Widget nightButton() {
    if (value) {
      return Container(
        width: 70.0,
        height: height,
        decoration: new BoxDecoration(
          color: Color(0xff28a1d8),
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'NIGHT',
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 70.0,
        height: height,
        child: Center(
          child: Text(
            'NIGHT',
            style: new TextStyle(
              color: Color(0xffb8b8b8),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            onSwitched();
          },
          child: Container(
            width: 134.0,
            height: 42.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? Color(0xffeaeaea)
                  : Color(0xff304854),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: <Widget>[
                  dayButton(),
                  nightButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
