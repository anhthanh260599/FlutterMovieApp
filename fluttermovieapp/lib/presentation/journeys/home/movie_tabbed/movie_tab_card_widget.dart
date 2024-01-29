import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/common/extensions/string_extension.dart';
import 'package:fluttermovieapp/data/core/api_constants.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title; 
  final String posterPath;

  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath
  }) : assert (movieId != null, "Mã phim không được trống"),
      assert (title != null, "Tên phim không được trống"),
      assert (posterPath != null, "Poster phim không được trống"),
      super(key: key);
      


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
            child: CachedNetworkImage( // Lấy hình ảnh từ API
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
              ),
          )
        ),
        Padding( // Padding giữa poster và tên phim
          padding: EdgeInsets.only(top: Sizes.dimen_4.h.toDouble()),
          child: Text(
            title.intelliTrim(),
            maxLines: 1, 
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    ),
    );
  }

}