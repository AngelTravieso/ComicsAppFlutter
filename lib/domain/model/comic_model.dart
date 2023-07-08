class ComicModel {
  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final List<Comic> comics;
  final String version;

  ComicModel({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.comics,
    required this.version,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        error: json['error'],
        limit: json['limit'],
        offset: json['offset'],
        numberOfPageResults: json['number_of_page_results'],
        numberOfTotalResults: json['number_of_total_results'],
        statusCode: json['status_code'],
        comics: List<Comic>.from(json['results'].map((x) => Comic.fromJson(x))),
        version: json['version'],
      );

  @override
  String toString() {
    return '''
      ComicModel(
        error: $error,
        limit: $limit,
        offset: $offset,
        numberOfPageResults: $numberOfPageResults,
        numberOfTotalResults: $numberOfTotalResults,
        statusCode: $statusCode,
        comics: $comics,
        version: $version,
      )
    ''';
  }
}

class Comic {
  final dynamic aliases;
  final String apiDetailUrl;
  final DateTime coverDate;
  final DateTime dateAdded;
  final DateTime dateLastUpdated;
  final dynamic deck;
  final String? description;
  final bool hasStaffReview;
  final int id;
  final Image image;
  final List<AssociatedImage> associatedImages;
  final String issueNumber;
  final String? name;
  final String siteDetailUrl;
  final dynamic storeDate;
  final Volume volume;

  Comic({
    this.aliases,
    required this.apiDetailUrl,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    this.deck,
    this.description,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.associatedImages,
    required this.issueNumber,
    this.name,
    required this.siteDetailUrl,
    this.storeDate,
    required this.volume,
  });

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        aliases: json['aliases'],
        apiDetailUrl: json['api_detail_url'],
        coverDate: DateTime.parse(json['cover_date']),
        dateAdded: DateTime.parse(json['date_added']),
        dateLastUpdated: DateTime.parse(json['date_last_updated']),
        deck: json['deck'],
        description: json['description'],
        hasStaffReview: json['has_staff_review'],
        id: json['id'],
        image: Image.fromJson(json['image']),
        associatedImages: List<AssociatedImage>.from(
            json['associated_images'].map((x) => AssociatedImage.fromJson(x))),
        issueNumber: json['issue_number'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
        storeDate: json['store_date'],
        volume: Volume.fromJson(json['volume']),
      );

  @override
  String toString() {
    return '''
      Comic(
        aliases: $aliases,
        apiDetailUrl: $apiDetailUrl,
        coverDate: $coverDate,
        dateAdded: $dateAdded,
        dateLastUpdated: $dateLastUpdated,
        deck: $deck,
        description: $description,
        hasStaffReview: $hasStaffReview,
        id: $id,
        image: $image,
        associatedImages: $associatedImages,
        issueNumber: $issueNumber,
        name: $name,
        siteDetailUrl: $siteDetailUrl,
        storeDate: $storeDate,
        volume: $volume,
      )
    ''';
  }
}

class AssociatedImage {
  final String originalUrl;
  final int id;
  final dynamic caption;
  final String imageTags;

  AssociatedImage({
    required this.originalUrl,
    required this.id,
    this.caption,
    required this.imageTags,
  });

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      AssociatedImage(
        originalUrl: json['original_url'],
        id: json['id'],
        caption: json['caption'],
        imageTags: json['image_tags'],
      );

  @override
  String toString() {
    return '''
      AssociatedImage(
        originalUrl: $originalUrl,
        id: $id,
        caption: $caption,
        imageTags: $imageTags,
      )
    ''';
  }
}

class Image {
  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;
  final String screenLargeUrl;
  final String smallUrl;
  final String superUrl;
  final String thumbUrl;
  final String tinyUrl;
  final String originalUrl;
  final String imageTags;

  Image({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        iconUrl: json['icon_url'],
        mediumUrl: json['medium_url'],
        screenUrl: json['screen_url'],
        screenLargeUrl: json['screen_large_url'],
        smallUrl: json['small_url'],
        superUrl: json['super_url'],
        thumbUrl: json['thumb_url'],
        tinyUrl: json['tiny_url'],
        originalUrl: json['original_url'],
        imageTags: json['image_tags'],
      );

  @override
  String toString() {
    return '''
      Image(
        iconUrl: $iconUrl,
        mediumUrl: $mediumUrl,
        screenUrl: $screenUrl,
        screenLargeUrl: $screenLargeUrl,
        smallUrl: $smallUrl,
        superUrl: $superUrl,
        thumbUrl: $thumbUrl,
        tinyUrl: $tinyUrl,
        originalUrl: $originalUrl,
        imageTags: $imageTags,
      )
    ''';
  }
}

class Volume {
  final String apiDetailUrl;
  final int id;
  final String name;
  final String siteDetailUrl;

  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json['api_detail_url'],
        id: json['id'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
      );

  @override
  String toString() {
    return '''
      Volume(
        apiDetailUrl: $apiDetailUrl,
        id: $id,
        name: $name,
        siteDetailUrl: $siteDetailUrl,
      )
    ''';
  }
}
