import 'package:flutter/material.dart';
import 'package:youtube/search.dart';
import 'package:youtube/telas/alta.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String? _result = "";


  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_result!),
      const Alta(),
      const Inscricao(),
      const Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("img/youtube.png", width: 98, height: 22),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        actions: [
          IconButton(
            onPressed: () async {
              String? r = await showSearch(context: context, delegate: CustomSearchDelegate());
              print("RESULTADO: $r");
              _result = r;
              },
            icon: Icon(Icons.search)
            ),
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle))

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              label: 'Em Alta',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Inscrições',
          ),BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Biblioteca',
          )
      ]),
    );
  }
}