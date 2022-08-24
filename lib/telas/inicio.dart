import 'package:flutter/material.dart';
import 'package:youtube/api_youtube.dart';
import 'package:youtube/modelos/video.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(){
    String pesquisa = "";
    Api api = Api();
    return api.pesquisar(pesquisa);
  }
  @override
  Widget build(BuildContext context) {


    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context,snapshot){
        var retorno;
        switch(snapshot.connectionState){
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
          case ConnectionState.done:
            if(snapshot.hasData){

              return ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      height: 4,
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(fit:BoxFit.cover,image: NetworkImage(video.img.toString()))
                            ),
                          ),
                          ListTile(
                            title: Text(video.title.toString()),
                            subtitle: Text(video.canal.toString()),
                          )
                        ],
                      );
                      //Divider();
                    },
                  );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
            break;
        }
      },
      );
  }
}