import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  }) : assert(height != null, 'chiều cao của logo không được để trống'),
        assert (height > 0, 'chiều cao của logo không được nhỏ hơn hoặc bằng 0'),
        super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h.toDouble(),
    );
    
  }
}