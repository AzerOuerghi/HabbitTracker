import 'package:flutter/material.dart';


class FlowtingButton extends StatelessWidget {
  final Function()? onPressed;
  const FlowtingButton( {super.key,  this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: (const Icon(Icons.add)),
    );
  }
}
