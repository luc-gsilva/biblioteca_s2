// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class lista_acervo_listview extends StatefulWidget {
  const lista_acervo_listview({Key? key}) : super(key: key);

  @override
  _lista_acervo_listviewState createState() => _lista_acervo_listviewState();
}

class _lista_acervo_listviewState extends State<lista_acervo_listview> {
//Referenciar a coleção do Firestore
  // ignore: prefer_typing_uninitialized_variables
  var historias;

  @override
  void initState() {
    super.initState();

    historias = FirebaseFirestore.instance.collection('Historias');
  }

  //
  // Especificar a aparência de cada elemento da List
  //
  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];

    return Container(
      child: Column(
        children: [

          Container(//TITULO 
          child:  Text(
            titulo,
            style: const TextStyle(fontSize: 30),
          ),),
         
          Container(//SUBTITULO
            child: Text(

              subtitulo,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              //
              // APAGAR um documento
              //
             historias.doc(item.id).delete();
            },
      
      
          ),
        ],
      ),
      
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acervo'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      backgroundColor: Colors.brown.shade100,

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
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/NovaHistoria');
        },
      ),
    );
  }
}