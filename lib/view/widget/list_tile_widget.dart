import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/controllers/provider_controller.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class ListTileWidget extends StatefulWidget {
  ListTileWidget({super.key, required this.item});
  MovieModel item;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  // Example to get the first movie
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        widget.item.image,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
      title: Text(
        widget.item.title,
        style: TextStyle(
          color: AppColor.pirmaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "${DateFormat("h:mm a").format(DateTime.now())} - ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
        style: TextStyle(color: AppColor.secondaryTextColor, fontSize: 14),
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.item.isBookmarked = !widget.item.isBookmarked;
          });

          Provider.of<ProviderController>(
            context,
            listen: false,
          ).removeMovie(widget.item);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${widget.item.title} removed from watched list'),
              backgroundColor: AppColor.secondaryTextColor,
              duration: Duration(seconds: 2),
            ),
          );
        },
        icon:
            widget.item.isBookmarked
                ? Icon(Icons.bookmark, color: AppColor.yellowColor)
                : Icon(Icons.bookmark_border, color: AppColor.yellowColor),
      ),
    );
  }
}
