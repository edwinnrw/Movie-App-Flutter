class Response {
  final int totalPages;
  final List<Movie> result;


  Response({this.totalPages, this.result});

  factory Response.fromJson(Map json) {
  
    return Response(
      totalPages: json['total_pages'],
      result:(json['results'] as List).map((i) => Movie.fromJson(i)).toList(),
    );
  }
}

class Movie{

    int id;
    final String title;
    final String posterPath;
    final String backdropPath;
    final String overview;
    final String releaseDate;

    Movie({this.id,this.title,this.posterPath,this.backdropPath,this.overview,this.releaseDate});

    factory Movie.fromJson(Map json) {
      return Movie(
        id: json['id'],
        title: json['title'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date']
      );
    }

}