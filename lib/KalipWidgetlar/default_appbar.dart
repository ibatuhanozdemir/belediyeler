import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String baslik;

  DefaultAppBar({this.baslik});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(baslik, style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}



/*
centerTitle: true,
backgroundColor: Colors.white,
title: Text("Ana Akış",style: TextStyle(color: Colors.black),),

 */