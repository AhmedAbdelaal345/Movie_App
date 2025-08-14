class MovieModel {
  final String title;
  final String desc;
  final double rating;
  final DateTime releaseDate;
  final String image;
   bool isBookmarked;
  final bool isFeatured;

  MovieModel({
    required this.title,
    required this.desc,
    required this.rating,
    required this.releaseDate,
    required this.image,
     this.isBookmarked=false,
    required this.isFeatured,
  });

  static List<MovieModel> getFakeMovies() {
    final List<MovieModel> movies = [];

    final List<String> bookTitles = [
      "The Last Journey", "Silent Echo", "Eternal Shadows", "Beyond the Horizon",
      "Midnight Chronicles", "The Hidden Truth", "Lost in Time", "Broken Memories",
      "The Final Hour", "Whispers in the Dark", "Rising Storm", "The Secret Code",
      "Forgotten Dreams", "The Perfect Alibi", "Shattered Reality", "Dark Waters",
      "The Invisible Enemy", "Deadly Silence", "Parallel Lives", "The Last Stand"
    ];

    final List<String> descriptions = [
      "A thrilling adventure that will keep you on the edge of your seat.",
      "An emotional journey through time and space that challenges perceptions.",
      "When darkness falls, the real story begins. A tale of courage and redemption.",
      "Sometimes the truth is hidden in plain sight. A mystery that unfolds slowly.",
      "Against all odds, heroes rise. An epic story of survival and hope."
    ];

    final List<String> images = [
      "assets/images/book.png",
      "assets/images/book_2.png",
      "assets/images/book_3.png",
      "assets/images/book_4.png",
      "assets/images/book_5.png",
      "assets/images/book_6.png",
      "assets/images/book_7.png",
      "assets/images/book_8.png",
      "assets/images/book_9.png",
      "assets/images/book_10.png",
      "assets/images/book_11.png",
      "assets/images/book_12.png",
      "assets/images/book_13.png",
      "assets/images/book_14.png",
    ];

    for (int i = 0; i < 100; i++) {
      final int titleIndex = i % bookTitles.length;
      final int descIndex = i % descriptions.length;
      final int imageIndex = i % 14; 

      final String title = "${bookTitles[titleIndex]} ${i + 1}";
      final String desc = descriptions[descIndex];
      final double rating = 7.5 + (i % 25) / 10; 

      final DateTime releaseDate = DateTime(2020, 1 + (i % 12), 1 + (i % 28));

      final String image = images[imageIndex];
      final bool isBookmarked = false;
      final bool isFeatured = i % 7 == 0; 

      movies.add(
          MovieModel(
            title: title,
            desc: desc,
            rating: rating,
            releaseDate: releaseDate,
            image: image,
            isBookmarked: isBookmarked,
            isFeatured: isFeatured,
          )
      );
    }

    return movies;
  }
}