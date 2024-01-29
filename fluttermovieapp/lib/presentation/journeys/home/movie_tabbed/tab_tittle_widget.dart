import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/presentation/themes/theme-text.dart';
import 'package:fluttermovieapp/presentation/themes/theme_color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback  onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : assert (title != null, "Tên danh mục không được bỏ trống"),
      assert (onTap != null, "Ontap không được bỏ trống"),
      assert (isSelected != null, "isSelected không được bỏ trống"),
      super (key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Tab Slider
      onTap: onTap,
      child:   Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppColor.royalBlue : Colors.transparent,
            width: Sizes.dimen_1.h.toDouble(),
          )
          )
      ),
      child:  Text(
      title,
      style: isSelected ? Theme.of(context).textTheme.royalBluetitleMedium : Theme.of(context).textTheme.titleMedium,
    ) ,
    ) ,
    );
    
    
  
  }

}