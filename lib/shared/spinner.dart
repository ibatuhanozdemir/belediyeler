import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF15202B),
      child: SpinKitChasingDots(
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
