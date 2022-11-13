import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(
        () {
          isLoaded = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://wallpapercave.com/wp/wp11221708.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Flutter RestApi',
                  style: const TextStyle(
                    fontSize: 22,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Column(
              children: <Widget>[
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://api.duniagames.co.id/api/content/upload/file/10197080431649739221.jpg",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 58, 196, 255),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 58, 196, 255),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "https://w0.peakpx.com/wallpaper/112/984/HD-wallpaper-anime-virtual-youtuber-kobo-kanaeru-hololive.jpg",
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                              height: 65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    posts![index].thumbnailUrl,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    posts![index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
