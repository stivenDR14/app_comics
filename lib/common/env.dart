enum enviroments {
  production, development
}

extension EnvConfig on enviroments{

  String get apiHost {
    switch (this) {
      case enviroments.production:
        return 'comicvine.gamespot.com';
      case enviroments.development:
        return 'comicvine.gamespot.com';
      default:
        return '';
    }
  }

  String get keyApi {
    switch (this) {
      case enviroments.production:
        return '2286ea319d46506daffbb5f49da868ff96dfad46';
      case enviroments.development:
        return '2286ea319d46506daffbb5f49da868ff96dfad46';
      default:
        return '';
    }
  }

  String get category => "/api/issues";

  String get params => "name,api_detail_url,volume,image,cover_date";

  String get jsonFormat => "json";
}
