enum enviroments {
  production, development
}

extension EnvConfig on enviroments{

  String get apiHost {
    switch (this) {
      case enviroments.production:
        return 'http://comicvine.gamespot.com/api/';
      case enviroments.development:
        return 'http://comicvine.gamespot.com/api/';
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

  String get category => "issues";

  String get jsonFormat => "json";
}
