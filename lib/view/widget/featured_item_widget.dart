import 'package:flutter/material.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/models/movie_model.dart';

class FeaturedItemWidget extends StatelessWidget {
  FeaturedItemWidget({super.key, required this.item});
  MovieModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 240,
            height: 320,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Center(
          child: Text(
            item.title,
            style: TextStyle(
              color: AppColor.pirmaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
