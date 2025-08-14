import 'package:flutter/material.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/view/pages/stitch_design.dart';
import 'package:movie_app/view/widget/featured_item_widget.dart';
import 'package:movie_app/view/widget/grid_movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static List<MovieModel> item = MovieModel.getFakeMovies();
  static List<MovieModel> featuredItem =
      item.where((item) => item.isFeatured).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Movie Catalog',

          style: TextStyle(
            color: AppColor.pirmaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            _sectionTitle('Featured Movies'),
            _featuredList(context),
            _sectionTitle('All Movies'),
            _allMoviesList(context),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColor.secondaryTextColor,
              width: 0.5,
            ),
          ),
          labelText: 'Search ',
          labelStyle: TextStyle(
            color: AppColor.secondaryTextColor,
            fontSize: 16,
          ),
          prefixIcon: Icon(Icons.search, color: AppColor.secondaryTextColor),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.pirmaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _allMoviesList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.45,
        ),
        itemCount: item.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StitchDesign(item: item[index]),
                ),
              );
            },
            child: GridMovieItem(item: item[index]),
          );
        },
      ),
    );
  }

  Widget _featuredList(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height /
          2.5, // Set a fixed height for the horizontal list
      child: ListView.separated(
        itemCount: featuredItem.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StitchDesign(item: featuredItem[index]),
                ),
              );
            },
            child: FeaturedItemWidget(item: featuredItem[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
