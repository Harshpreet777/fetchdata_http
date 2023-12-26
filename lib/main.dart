import 'package:fetchdemo2/model/album_response_model.dart';
import 'package:fetchdemo2/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<AlbumResponseModel>> responseAlbum;

  @override
  void initState() {
    super.initState();
    responseAlbum = ApiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Http'),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FutureBuilder<List<AlbumResponseModel>>(
            future: responseAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<AlbumResponseModel> albums = snapshot.data!;
      
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: albums.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    AlbumResponseModel album = albums[index];
      
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        child: ListTile(
                          title: Text(album.id.toString()),
                          subtitle: Text(album.title ?? ''),
                        ),
                      ),
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          )
        ]),
      ),
    );
  }
}
