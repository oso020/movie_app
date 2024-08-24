import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';

import '../../../api_service/mohamed_ali/discover_response.dart';
import '../../../color/color_app.dart';

class DiscoverItem extends StatelessWidget {

  Results results;
  DiscoverItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: results.id);

      },
      child: CachedNetworkImage(
      width: 150.w,
      height: 100.h,
      fit: BoxFit.fill,
      imageUrl:
      "https://image.tmdb.org/t/p/w500/${results.posterPath ?? ''}",
      errorWidget: (context, url, error) => Icon(Icons.error,color: ColorApp.primaryColor,),
      ),
    );
  }
}
