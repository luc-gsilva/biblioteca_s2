// ignore_for_file: camel_case_types

/* objetivo: fazer um menu de conta de usuario para mexer em opçoes de visualização e editar informaçoes pessoais da conta*/

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Tela_Inicial_ABERTO extends StatefulWidget {
  const Tela_Inicial_ABERTO({Key? key}) : super(key: key);

  @override
  State<Tela_Inicial_ABERTO> createState() => _Tela_Inicial_ABERTOState();
}

class _Tela_Inicial_ABERTOState extends State<Tela_Inicial_ABERTO> {
  var historias;
  String? codeDialog;
  String? valueText;
  var pesquisa;

  @override
  void initState() {
    super.initState();

    historias = FirebaseFirestore.instance
        .collection('Historias')
        .where('visibilidade', isEqualTo: true);
  }

  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];

    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(
          color: Colors.orange.shade300,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            //TITULO

            child: Text(
              titulo,
              style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 236, 205, 64),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            //SUBTITULO
            child: Text(
              
              subtitulo,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 236, 205, 64),
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            // imagem
            margin: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(
                color: Colors.orange.shade300,
                width: 18,
              ),
            ),
            child:
                Image.asset('lib/Img/Generico/imagem ilustrativa marron.jpg'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FloatingActionButton.extended(
              label: Text('continuar leitura'),
              foregroundColor: Colors.black54,
              backgroundColor: Colors.white12.withOpacity(0.85),
              icon: Icon(Icons.search),
              onPressed: () async {
                Navigator.pushNamed(context, '/POST',
                    arguments: ({
                      "uid": item.id,
                      "titulo_pub": titulo,
                      "autor_pub": item.data()['autor'],
                      "subtitulo_pub": item.data()['subtitulo'],
                      "texto": item.data()['sinopse']
                    }));
              },
            ),
            FloatingActionButton.extended(
              label: Text('previa'),
              foregroundColor: Colors.redAccent,
              backgroundColor: Colors.white12.withOpacity(0.23),
              icon: Icon(Icons.search),
              onPressed: () async {
                showModalBottomSheet(
                    isDismissible: true,
                    enableDrag: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 0, 0, 0), width: 1),
                          color: Colors.transparent,
                        ),
                        child: ListView(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Spacer(),
                                Container(
                                  height: 5,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.red,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            Container(
                              child: Text(
                                'Previa do texto',
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton.extended(
                                    label: Text('continuar leitura'),
                                    foregroundColor:
                                        const Color.fromARGB(137, 255, 0, 0),
                                    backgroundColor:
                                        Colors.white12.withOpacity(0.85),
                                    icon: Icon(Icons.search),
                                    onPressed: () async {
                                      Navigator.pushNamed(context, '/POST',
                                          arguments: ({
                                            "uid": item.id,
                                            "titulo_pub": titulo,
                                            "autor_pub": item.data()['autor'],
                                            "subtitulo_pub":
                                                item.data()['subtitulo'],
                                            "texto": item.data()['sinopse']
                                          }));
                                    },
                                  ),
                                ])
                          ],
                        ),
                      );
                    });
              },
            )
          ]
          )
        ,SizedBox(height: 10,) ],
      ),
     
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          backgroundColor: Colors.redAccent.shade200,
          actions: [
            /* IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),*/
          ],
          toolbarHeight: 88,
          title: Row(children: [
            Image.asset(
              'lib/Img/Generico/logo-bs3bwide.jpg',
              fit: BoxFit.contain,
              height: 60,
              alignment: FractionalOffset.center,
              opacity: const AlwaysStoppedAnimation(.7),
            ),
            Container(
              padding: const EdgeInsets.all(13.0),
              child: Text('Biblioteca S3'),
            )
          ]),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Text(
                  'Biblioteca_S3',
                  style: TextStyle(
                    color: Color.fromARGB(255, 4, 69, 165),
                    fontSize: 24,
                    height: 3.5,
                    letterSpacing: 5,
                    decoration: TextDecoration.overline, //make underline
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.g_mobiledata),
                title: Text('Entrar Com google'),
                /*
                 onTap: () => if (FirebaseAuth.instance.currentUser != null/* or controller.googleAccount.value != null*/) {
                  print(FirebaseAuth.instance.currentUser?.uid);
                  }Navigator.pushNamed(context, '/login_improved'),
                */
                onTap: () => Navigator.pushNamed(context, '/login_improved'),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Entrar Com Email'),
                onTap: () => Navigator.pushNamed(context, '/login'),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Cadastrar conta'),
                onTap: () => Navigator.pushNamed(context, '/criar_conta'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('Historias'),
                onTap: () => Navigator.pushNamed(context, '/TELA_INICIAL'),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Sobre'),
                onTap: () => Navigator.pushNamed(context, '/sobre'),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white12,
        //
        // LISTAR os documentos da COLEÇÃO
        //
        body: StreamBuilder<QuerySnapshot>(
            //fonte de dados (coleção)
            stream: historias.snapshots(),

            //exibir os dados retornados
            builder: (context, snapshot) {
              //verificar o estado da conexão
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text('Não foi possível conectar ao Firestore'),
                  );

                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                //se os dados foram recebidos com sucesso
                default:
                  final dados = snapshot.requireData;
                  return ListView.builder(
                      itemCount: dados.size,
                      itemBuilder: (context, index) {
                        return exibirItemColecao(dados.docs[index]);
                      });
              }
            }),
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.yellow.shade600,
            backgroundColor: Colors.green.shade600,
            child: Icon(Icons.search),
            onPressed: () {
              _displayTextInputDialog(context);
              //Navigator.pushNamed(context, '/pesquisa', arguments: pesquisa);
            })

        //-----botão com InsetsController

        );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //title: const Text('O que você procura?'),
            content: TextField(
              controller: pesquisa,
              style: TextStyle(color: Colors.brown, fontSize: 36),
              decoration: InputDecoration(
                labelText: 'O que voce procura?',
                labelStyle: TextStyle(color: Colors.brown, fontSize: 22),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('Deixa pra lá'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Buscar'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pushNamed(context, '/pesquisa',
                        arguments: pesquisa);
                  });
                },
              ),
            ],
          );
        });
  }
}
