import 'package:flutter/material.dart';
import 'package:movie_app/controllers/provider_controller.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class GridMovieItem extends StatefulWidget {
  GridMovieItem({super.key, required this.item});
  MovieModel item;

  @override
  State<GridMovieItem> createState() => _GridMovieItemState();
}

class _GridMovieItemState extends State<GridMovieItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 240,
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.item.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.item.isBookmarked = !widget.item.isBookmarked;
                });
                if (widget.item.isBookmarked) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.item.title} added to watched list',
                        style: TextStyle(color: AppColor.backGroundColor),
                      ),
                      backgroundColor: AppColor.pirmaryTextColor,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Provider.of<ProviderController>(
                    context,
                    listen: false,
                  ).addMovie(widget.item);
                } else {
                  Provider.of<ProviderController>(
                    context,
                    listen: false,
                  ).removeMovie(widget.item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${widget.item.title} removed from watched list',
                      ),
                      backgroundColor: AppColor.secondaryTextColor,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              icon:
                  widget.item.isBookmarked
                      ? Icon(Icons.bookmark, color: AppColor.yellowColor)
                      : Icon(
                        Icons.bookmark_border,
                        color: AppColor.yellowColor,
                      ),
            ),
          ],
        ),
        Text(
          widget.item.title,
          style: TextStyle(
            color: AppColor.pirmaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
