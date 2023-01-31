import 'package:flutter/material.dart';

class CycleButton extends StatefulWidget {
  final IconData iconData;
  final String title;
  final GestureTapCallback onTap;

  const CycleButton({ required this.iconData, required this.title, required this.onTap});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CycleButtonState();
  }
}

class CycleButtonState extends State<CycleButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Expanded(child:
    Column(
      children:  [
        RawMaterialButton(
          onPressed: this.widget.onTap,
          fillColor: Colors.grey,
          child: Icon(
            this.widget.iconData,
            color:Colors.white,
            size: 30.0,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          this.widget.title,
          style: TextStyle(color: Colors.black54),
        ),
      ],
    )
    );

  }

}