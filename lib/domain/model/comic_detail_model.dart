class ComicDetail {
  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final Results results;
  final String version;

  ComicDetail({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  factory ComicDetail.fromJson(Map<String, dynamic> json) => ComicDetail(
        error: json['error'],
        limit: json['limit'],
        offset: json['offset'],
        numberOfPageResults: json['number_of_page_results'],
        numberOfTotalResults: json['number_of_total_results'],
        statusCode: json['status_code'],
        results: Results.fromJson(json['results']),
        version: json['version'],
      );
}

class Results {
  final dynamic aliases;
  final String apiDetailUrl;
  final List<AssociatedImages> associatedImages;
  final List<ComicVolume> characterCredits;
  final List<dynamic> characterDiedIn;
  final List<ComicVolume> conceptCredits;
  final DateTime coverDate;
  final DateTime dateAdded;
  final DateTime dateLastUpdated;
  final dynamic deck;
  final String description;
  final dynamic firstAppearanceCharacters;
  final dynamic firstAppearanceConcepts;
  final dynamic firstAppearanceLocations;
  final dynamic firstAppearanceObjects;
  final dynamic firstAppearanceStoryarcs;
  final dynamic firstAppearanceTeams;
  final bool hasStaffReview;
  final int id;
  final Images image;
  final String issueNumber;
  final List<ComicVolume> locationCredits;
  final String name;
  final List<dynamic> objectCredits;
  final List<ComicVolume> personCredits;
  final String siteDetailUrl;
  final dynamic storeDate;
  final List<dynamic> storyArcCredits;
  final List<dynamic> teamCredits;
  final List<dynamic> teamDisbandedIn;
  final ComicVolume volume;

  Results({
    this.aliases,
    required this.apiDetailUrl,
    required this.associatedImages,
    required this.characterCredits,
    required this.characterDiedIn,
    required this.conceptCredits,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    this.deck,
    required this.description,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryarcs,
    this.firstAppearanceTeams,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.locationCredits,
    required this.name,
    required this.objectCredits,
    required this.personCredits,
    required this.siteDetailUrl,
    this.storeDate,
    required this.storyArcCredits,
    required this.teamCredits,
    required this.teamDisbandedIn,
    required this.volume,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        aliases: json['aliases'],
        apiDetailUrl: json['api_detail_url'],
        associatedImages: List<AssociatedImages>.from(
            json['associated_images'].map((x) => AssociatedImages.fromJson(x))),
        characterCredits: List<ComicVolume>.from(
            json['character_credits'].map((x) => ComicVolume.fromJson(x))),
        characterDiedIn:
            List<dynamic>.from(json['character_died_in'].map((x) => x)),
        conceptCredits: List<ComicVolume>.from(
            json['concept_credits'].map((x) => ComicVolume.fromJson(x))),
        coverDate: DateTime.parse(json['cover_date']),
        dateAdded: DateTime.parse(json['date_added']),
        dateLastUpdated: DateTime.parse(json['date_last_updated']),
        deck: json['deck'],
        description: json['description'],
        firstAppearanceCharacters: json['first_appearance_characters'],
        firstAppearanceConcepts: json['first_appearance_concepts'],
        firstAppearanceLocations: json['first_appearance_locations'],
        firstAppearanceObjects: json['first_appearance_objects'],
        firstAppearanceStoryarcs: json['first_appearance_storyarcs'],
        firstAppearanceTeams: json['first_appearance_teams'],
        hasStaffReview: json['has_staff_review'],
        id: json['id'],
        image: Images.fromJson(json['image']),
        issueNumber: json['issue_number'],
        locationCredits: List<ComicVolume>.from(
            json['location_credits'].map((x) => ComicVolume.fromJson(x))),
        name: json['name'],
        objectCredits: List<dynamic>.from(json['object_credits'].map((x) => x)),
        personCredits: List<ComicVolume>.from(
            json['person_credits'].map((x) => ComicVolume.fromJson(x))),
        siteDetailUrl: json['site_detail_url'],
        storeDate: json['store_date'],
        storyArcCredits:
            List<dynamic>.from(json['story_arc_credits'].map((x) => x)),
        teamCredits: List<dynamic>.from(json['team_credits'].map((x) => x)),
        teamDisbandedIn:
            List<dynamic>.from(json['team_disbanded_in'].map((x) => x)),
        volume: ComicVolume.fromJson(json['volume']),
      );
}

class AssociatedImages {
  final String originalUrl;
  final int id;
  final dynamic caption;
  final String imageTags;

  AssociatedImages({
    required this.originalUrl,
    required this.id,
    this.caption,
    required this.imageTags,
  });

  factory AssociatedImages.fromJson(Map<String, dynamic> json) =>
      AssociatedImages(
        originalUrl: json['original_url'],
        id: json['id'],
        caption: json['caption'],
        imageTags: json['image_tags'],
      );
}

class ComicVolume {
  final String apiDetailUrl;
  final int id;
  final String name;
  final String siteDetailUrl;
  final String? role;

  ComicVolume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    this.role,
  });

  factory ComicVolume.fromJson(Map<String, dynamic> json) => ComicVolume(
        apiDetailUrl: json['api_detail_url'],
        id: json['id'],
        name: json['name'],
        siteDetailUrl: json['site_detail_url'],
        role: json['role'],
      );
}

class Images {
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

  Images({
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

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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
}
