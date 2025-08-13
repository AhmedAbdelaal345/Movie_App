import 'package:flutter/material.dart';
import 'package:movie_app/controllers/provider_controller.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/view/widget/list_tile_widget.dart';
import 'package:provider/provider.dart';

class WatchedListPage extends StatelessWidget {
  const WatchedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get movies from provider instead of static list
    final watchedMovies =
        context
            .watch<ProviderController>()
            .movies
            .where((movie) => movie.isBookmarked)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Watched List",
          style: TextStyle(
            color: AppColor.pirmaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.backGroundColor,
        centerTitle: true,
      ),
      backgroundColor: AppColor.backGroundColor,
      body:
          watchedMovies.isNotEmpty
              ? ListView.builder(
                itemCount: watchedMovies.length, // Add itemCount
                itemBuilder:
                    (context, index) =>
                        ListTileWidget(item: watchedMovies[index]),
              )
              : const Center(
                child: Text(
                  "No Movies Watched",
                  style: TextStyle(
                    color: AppColor.pirmaryTextColor,
                    fontSize: 24,
                  ),
                ),
              ),
    );
  }
}
