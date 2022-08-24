import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/modelos/video.dart';

/* CANAL DO WINDERSON NUNES */

const API_KEY = "AIzaSyBpixM12vFNOm6zna0rD6H37Ns8q5vvavw";
const ID_CANAL_WIND = "UC3KQ5GWANYF8lChqjZpXsQw";
// ignore: constant_identifier_names
const URL_BASE = "https://www.googleapis.com/youtube/v3";


// classe que trabalha com API do YouTube

class Api{
  Future<List<Video>>pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(
      // ignore: prefer_interpolation_to_compose_strings
      URL_BASE + "/search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$API_KEY"
        "&channelId=$ID_CANAL_WIND"
        "&q=$pesquisa"
      ));
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();
    return videos;
  }
}

