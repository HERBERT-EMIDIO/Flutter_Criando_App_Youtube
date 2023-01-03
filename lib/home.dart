import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_navegacao_inferior/telas/biblioteca.dart';
import 'package:youtube_navegacao_inferior/telas/em_alta.dart';
import 'package:youtube_navegacao_inferior/telas/inicio.dart';
import 'package:youtube_navegacao_inferior/telas/inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/youtube.png',
          width: 110,
          height: 100,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('VideoCam');
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print('Ação: Pesquisa');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('Ação: Conta');
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      //------------------ parte inferior -----------------------------
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indicebotao) {
          setState(() {
            print(indicebotao);
            _indiceAtual = indicebotao;
          });
        },
        //type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,

        // ignore: prefer_const_literals_to_create_immutables
        items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            icon: const Icon(Icons.home),
            label: 'Início',
          ),
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            //backgroundColor: Colors.purple,
            icon: const Icon(Icons.whatshot),
            label: 'Em alta',
          ),
          const BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            icon: Icon(Icons.subscriptions),
            label: 'Inscrições',
          ),
          const BottomNavigationBarItem(
            //backgroundColor: Colors.yellow,
            icon: Icon(Icons.folder),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
