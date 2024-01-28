import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {

  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material( 
      elevation: 32, // dùng để đổ bóng cho card
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
      child: GestureDetector( // Dùng để tạo hàm Tap
        onTap: () {},
        child:   ClipRRect( // Dùng ClipRReact đẻ border radius
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
          child:  CachedNetworkImage( // Dùng để lấy hình ảnh
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}