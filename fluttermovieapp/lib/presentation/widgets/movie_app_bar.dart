import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/common/sceenutils/sceenutils.dart';
import 'package:fluttermovieapp/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h.toDouble(),
        left: Sizes.dimen_16.w.toDouble(),
        right: Sizes.dimen_16.w.toDouble()

      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {}, 
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_12.h.toDouble(),
            )
          ),
          Expanded(
            child: const Logo(
              height: Sizes.dimen_14
              )
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
  
}