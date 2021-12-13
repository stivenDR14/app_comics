class Comic {

  Comic({
    this.aliases,
    this.apiDetailUrl,
    this.characterCredits,
    this.charactersDiedIn,
    this.conceptCredits,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.disbandedTeams,
    this.firstAppearanceCharacters,
    this.firstAppearanceConcepts,
    this.firstAppearanceLocations,
    this.firstAppearanceObjects,
    this.firstAppearanceStoryarcs,
    this.firstAppearanceTeams,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.locationCredits,
    this.name,
    this.objectCredits,
    this.personCredits,
    this.siteDetailUrl,
    this.storeDate,
    this.storyArcCredits,
    this.teamCredits,
    this.teamsDisbandedIn,
    this.volume,
  });

  dynamic aliases;
  dynamic apiDetailUrl;
  List<dynamic>? characterCredits;
  dynamic charactersDiedIn;
  List<dynamic>? conceptCredits;
  dynamic coverDate;
  dynamic dateAdded;
  dynamic dateLastUpdated;
  dynamic deck;
  dynamic description;
  dynamic disbandedTeams;
  dynamic firstAppearanceCharacters;
  dynamic firstAppearanceConcepts;
  dynamic firstAppearanceLocations;
  dynamic firstAppearanceObjects;
  dynamic firstAppearanceStoryarcs;
  dynamic firstAppearanceTeams;
  dynamic hasStaffReview;
  dynamic id;
  Map<String, dynamic>? image;
  dynamic issueNumber;
  List<dynamic>? locationCredits;
  dynamic name;
  List<dynamic>? objectCredits;
  List<dynamic>? personCredits;
  dynamic siteDetailUrl;
  dynamic storeDate;
  List<dynamic>? storyArcCredits;
  dynamic teamCredits;
  dynamic teamsDisbandedIn;
  Map<String, dynamic>? volume;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
      aliases:json["aliases"],
      apiDetailUrl:json["api_detail_url"],
      characterCredits:json["character_credits"],
      charactersDiedIn:json["characters_died_in"],
      conceptCredits: json["concept_credits"],
      coverDate:json["cover_date"],
      dateAdded:json["date_added"],
      dateLastUpdated:json["date_last_updated"],
      deck:json["deck"],
      description:json["description"],
      disbandedTeams:json["disbanded_teams"],
      firstAppearanceCharacters:json["first_appearance_characters"],
      firstAppearanceConcepts:json["first_appearance_concepts"],
      firstAppearanceLocations:json["first_appearance_locations"],
      firstAppearanceObjects:json["first_appearance_objects"],
      firstAppearanceStoryarcs:json["first_appearance_storyarcs"],
      firstAppearanceTeams:json["first_appearance_teams"],
      hasStaffReview:json["has_staff_review"],
      id:json["id"],
      image:json["image"],
      issueNumber:json["issue_number"],
      locationCredits:json["location_credits"],
      name:json["name"],
      objectCredits:json["object_credits"],
      personCredits:json["person_credits"],
      siteDetailUrl:json["site_detail_url"],
      storeDate:json["store_date"],
      storyArcCredits:json["story_arc_credits"],
      teamCredits:json["team_credits"],
      teamsDisbandedIn:json["teams_disbanded_in"],
      volume:json["volume"],
  );

  Map<String, dynamic> generalDataToMap() => {
    "Imagen":image!["icon_url"],
    "Alias":aliases,
    "Fecha de portada":coverDate,
    "Fecha de publicación":dateAdded,
    "Última fecha de actualización":dateLastUpdated,
    "Plataforma":deck,
    "Descripción":description!=null?description.replaceAll(RegExp('</p>'), '').replaceAll(RegExp('<p>'), ''):"",
    "Primera aparición personajes":firstAppearanceCharacters,
    "Primera aparición conceptos":firstAppearanceConcepts,
    "Primera aparición localizaciones":firstAppearanceLocations,
    "Primera aparición Objetos":firstAppearanceObjects,
    "Primera aparición arcos de historia":firstAppearanceStoryarcs,
    "Primera aparición equipos":firstAppearanceTeams,
    "Revisiones":hasStaffReview,
    "Nombre":name,
    "Nombre del volumen":volume!["name"],
  };

  Map<String,List<String>> itemsToArray()  {
    Map<String,List<String>> arrayMap={"Personajes":[], "Conceptos":[],
      "Localizaciones":[], "Objetos":[], "Personas:":[],
      "Arcos de historia":[]};
    if(characterCredits != null){
      for (var element in characterCredits!) {
        if(arrayMap["Conceptos"] != null){
          arrayMap["Conceptos"]!.add(element!["name"]);
        }

      }
    }

    if(conceptCredits != null){
      for (var element in conceptCredits!) {
        if(arrayMap["Conceptos"] != null){
          arrayMap["Conceptos"]!.add(element!["name"]);
        }
      }
    }

    if(locationCredits != null){
      for (var element in locationCredits!) {
        if(arrayMap["Localizaciones"] != null){
          arrayMap["Localizaciones"]!.add(element!["name"]);
        }
      }
    }

    if(objectCredits != null){
      for (var element in objectCredits!) {
        arrayMap["Objetos"]!.add(element!["name"]);
        if(arrayMap["Objetos"] != null){
          arrayMap["Objetos"]!.add(element!["name"]);
        }
      }
    }

    if(personCredits != null){
      for (var element in personCredits!) {
        if(arrayMap["Personas"] != null){
          arrayMap["Personas"]!.add(element!["name"]);
        }
      }
    }

    if(storyArcCredits != null){
      for (var element in storyArcCredits!) {
        if(arrayMap["Arcos de historia"] != null){
          arrayMap["Arcos de historia"]!.add(element!["name"]);
        }

      }
    }


    return arrayMap;
  }


}