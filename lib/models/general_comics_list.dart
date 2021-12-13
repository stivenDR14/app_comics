class GeneralComicsList {

  GeneralComicsList({
    this.apiDetailUrl,
    this.image,
    this.name,
    this.volume,
    this.coverDate
  });

  String? apiDetailUrl;
  Map<String, dynamic>? image;
  String? name;
  Map<String, dynamic>? volume;
  String? coverDate;

  factory GeneralComicsList.fromJson(Map<String, dynamic> json) => GeneralComicsList(
      apiDetailUrl:json["api_detail_url"],
      image: json["image"],
      name: json["name"],
      volume: json["volume"],
      coverDate: json["cover_date"]
  );

}