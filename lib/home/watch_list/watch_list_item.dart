import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/firebase_utils.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';


class WatchListItem extends StatefulWidget {
  Movie movie;

  WatchListItem({required this.movie});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  bool isWatchList=true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: int.parse(widget.movie.id));
          },
          child: Row(
            children: [
              SizedBox(width: 10.w,),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: NetworkImageCustom(image: widget.movie.imageUrl, width: 160.w, height: 120.h,)
                  ),
                  InkWell(
                    onTap: (){

                      FirebaseUtils.deleteMovieFromFireStore(widget.movie);
                      // Update the UI
                      setState(() {

                      });
                    },
                    child: Image.asset(
                      "assets/images/bookmark_saved.png",
                      width: 30.w,
                      height: 40.h,
                      fit: BoxFit.fill,
                    )
                  ),
                ],
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       widget.movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(height: 20.h,),
                    Text(
                        DateFormat.yMMMd().format(DateTime.parse(widget.movie.dateTime.toString())),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18.sp, color: ColorApp.greyShade4),
                    ),
                    SizedBox(height: 10.h,),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
