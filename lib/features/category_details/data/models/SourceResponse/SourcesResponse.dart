import 'package:news_app/features/category_details/domain/entities/SourcesEntity/SourcesEntity.dart';

import 'Source.dart';

/// status : "ok"
/// code : "apiKeyInvalid"
/// message : "Your API key is invalid or incorrect. Check your key, or go to https://newsapi.org to create a free API key."
/// sources : [{"id":"bbc-sport","name":"BBC Sport","description":"The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.","url":"http://www.bbc.co.uk/sport","category":"sports","language":"en","country":"gb"},{"id":"bleacher-report","name":"Bleacher Report","description":"Sports journalists and bloggers covering NFL, MLB, NBA, NHL, MMA, college football and basketball, NASCAR, fantasy sports and more. News, photos, mock drafts, game scores, player profiles and more!","url":"http://www.bleacherreport.com","category":"sports","language":"en","country":"us"},{"id":"espn","name":"ESPN","description":"ESPN has up-to-the-minute sports news coverage, scores, highlights and commentary for NFL, MLB, NBA, College Football, NCAA Basketball and more.","url":"https://www.espn.com","category":"sports","language":"en","country":"us"},{"id":"espn-cric-info","name":"ESPN Cric Info","description":"ESPN Cricinfo provides the most comprehensive cricket coverage available including live ball-by-ball commentary, news, unparalleled statistics, quality editorial comment and analysis.","url":"http://www.espncricinfo.com/","category":"sports","language":"en","country":"us"},{"id":"football-italia","name":"Football Italia","description":"Italian football news, analysis, fixtures and results for the latest from Serie A, Serie B and the Azzurri.","url":"http://www.football-italia.net","category":"sports","language":"en","country":"it"},{"id":"four-four-two","name":"FourFourTwo","description":"The latest football news, in-depth features, tactical and statistical analysis from FourFourTwo, the UK&#039;s favourite football monthly.","url":"http://www.fourfourtwo.com/news","category":"sports","language":"en","country":"gb"},{"id":"fox-sports","name":"Fox Sports","description":"Find live scores, player and team news, videos, rumors, stats, standings, schedules and fantasy games on FOX Sports.","url":"http://www.foxsports.com","category":"sports","language":"en","country":"us"},{"id":"nfl-news","name":"NFL News","description":"The official source for NFL news, schedules, stats, scores and more.","url":"https://www.nfl.com","category":"sports","language":"en","country":"us"},{"id":"nhl-news","name":"NHL News","description":"The most up-to-date breaking hockey news from the official source including interviews, rumors, statistics and schedules.","url":"https://www.nhl.com/news","category":"sports","language":"en","country":"us"},{"id":"talksport","name":"TalkSport","description":"Tune in to the world's biggest sports radio station - Live Premier League football coverage, breaking sports news, transfer rumours &amp; exclusive interviews.","url":"http://talksport.com","category":"sports","language":"en","country":"gb"},{"id":"the-sport-bible","name":"The Sport Bible","description":"TheSPORTbible is one of the largest communities for sports fans across the world. Send us your sporting pictures and videos!","url":"https://www.thesportbible.com","category":"sports","language":"en","country":"gb"}]

class SourceResponse {
  SourceResponse({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  SourcesEntity toSourcesEntity() {
    return SourcesEntity(
      status: status,
      code: code,
      message: message,
      sources: sources?.map((Source) => Source.toSourceEntity()).toList(),
    );
  }
}
