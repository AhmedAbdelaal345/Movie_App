import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/controllers/provider_controller.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class StitchDesign extends StatefulWidget {
  MovieModel? item; // Move item here as a parameter

  StitchDesign({super.key, required this.item}); // Add required parameter

  @override
  State<StitchDesign> createState() => _StitchDesignState();
}

class _StitchDesignState extends State<StitchDesign> {
  @override
  Widget build(BuildContext context) {
    // Add null check at the beginning
    if (widget.item == null) {
      return Center(
        child: Text(
          'No movie data available',
          style: TextStyle(fontSize: 16, color: AppColor.secondaryTextColor),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColor.pirmaryTextColor),
          ),
        ),
        backgroundColor: AppColor.backGroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    Image.asset(widget.item!.image, fit: BoxFit.cover),
                    // Gradient Overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                widget.item!.title,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.pirmaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
                top: 8,
                left: 8,
                right: 8,
              ),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "${DateFormat("h:mm a").format(DateTime.now())} - ${DateFormat("dd MMMM yyyy").format(DateTime.now())}",
                      style: TextStyle(
                        color: AppColor.secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.item!.isBookmarked = !widget.item!.isBookmarked;
                      setState(() {});

                      if (widget.item!.isBookmarked) {
                        Provider.of<ProviderController>(
                          context,
                          listen: false,
                        ).addMovie(widget.item!);
                      } else {
                        Provider.of<ProviderController>(
                          context,
                          listen: false,
                        ).removeMovie(widget.item!);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${widget.item!.title} ${widget.item!.isBookmarked ? "added to" : "removed from"} watched list',
                            style: TextStyle(
                              color:
                                  widget.item!.isBookmarked
                                      ? AppColor.backGroundColor
                                      : AppColor.pirmaryTextColor,
                            ),
                          ),
                          backgroundColor:
                              widget.item!.isBookmarked
                                  ? AppColor.pirmaryTextColor
                                  : AppColor.secondaryTextColor,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    icon:
                        widget.item!.isBookmarked
                            ? Icon(Icons.star, color: AppColor.yellowColor)
                            : Icon(
                              Icons.star_border,
                              color: AppColor.yellowColor,
                            ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                child: Text(
                  widget.item!.desc,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.pirmaryTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
