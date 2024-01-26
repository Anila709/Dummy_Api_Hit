import 'dart:convert';

import 'package:dummy_api_hit/models/color_model.dart';
import 'package:dummy_api_hit/models/wallpaper_model.dart';
import 'package:dummy_api_hit/screens/wallpaper_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  var mController = TextEditingController();
  var searchQuery = "car";

  List<ColorModel> mColorList = [
    ColorModel(colorValue: Colors.white, colorCode: "ffffff"),
    ColorModel(colorValue: Colors.black, colorCode: "000000"),
    ColorModel(colorValue: Colors.blue, colorCode: "0000ff"),
    ColorModel(colorValue: Colors.green, colorCode: "00ff00"),
    ColorModel(colorValue: Colors.red, colorCode: "ff0000"),
    ColorModel(colorValue: Colors.purple, colorCode: "9C27B0"),
    ColorModel(colorValue: Colors.orange, colorCode: "FF9800"),
    ColorModel(colorValue: Colors.cyan, colorCode: "00BCD4"),
  ];

  Future<WallpaperDataModel?>? mData;
  Future<WallpaperDataModel?>? mTrendingData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mData = getWallpaper(query: searchQuery);
    mTrendingData = getTrendingWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Wallpaper'),
      ),
      body: Column(
        children: [
          searchUI(),
          SizedBox(
              height: 200,
              child: FutureBuilder<WallpaperDataModel?>(
                  future: mTrendingData,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error.toString()}"),
                      );
                    } else if (snapshot.hasData) {
                      var data = snapshot.data!;
                      return snapshot.data != null &&
                              snapshot.data!.photos!.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.photos!.length,
                              itemBuilder: (_, index) {
                                var eachPhoto =
                                    data.photos![index].src!.portrait!;
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      navigateToDetailpage(eachPhoto);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11),
                                      child: Image.network(
                                        eachPhoto,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : Container(
                              child: Center(
                                child: Text('No Wallpaper!!'),
                              ),
                            );
                    }
                    return Container();
                  })),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mColorList.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      mData = getWallpaper(
                          query: mController.text.toString(),
                          colorCode: mColorList[index].colorCode!);
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(11),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(11),
                          color: mColorList[index].colorValue),
                    ),
                  );
                }),
          ),
          Expanded(
            child: FutureBuilder<WallpaperDataModel?>(
                future: mData,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    return snapshot.data != null &&
                            snapshot.data!.photos!.isNotEmpty
                        ? GridView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: snapshot.data!.photos!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 11,
                                    crossAxisSpacing: 11,
                                    childAspectRatio: 9 / 16),
                            itemBuilder: (_, index) {
                              var eachPhoto =
                                  snapshot.data!.photos![index].src!.portrait!;
                              return Hero(
                                tag: Duration(seconds: 2),
                                child: InkWell(
                                  onTap: () {
                                    navigateToDetailpage(eachPhoto);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11),
                                    child: Image.network(
                                      eachPhoto,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Center(
                              child: Text('No Wallpaper!!'),
                            ),
                          );
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }

  void navigateToDetailpage(String url){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WallpaperDetailsPage(wallUrl: url)));
  }

  Widget searchUI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.88,
            child: TextField(
              cursorColor: Colors.black,
              controller: mController,
              decoration: InputDecoration(
                  hintText: 'search wallpaper',
                  hintStyle: TextStyle(color: Colors.black45),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          IconButton(
              onPressed: () {
                if (mController.text.isNotEmpty) {
                  searchQuery = mController.text.toString();
                  setState(() {
                    mData = getWallpaper(query: searchQuery);
                  });
                }
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade600,
              )),
        ],
      ),
    );
  }

  Future<WallpaperDataModel?> getWallpaper(
      {String? query, String? colorCode = ""}) async {
    var myApiKey = "lLGZiqQUy25YBe9qTDs7DSbHpO7X72BPg6FkAd9IG0VxSRWbhXg5EirB";
    var uri = Uri.parse(
        "https://api.pexels.com/v1/search?query=$query&color=$colorCode");
    var response = await http.get(uri, headers: {
      "Authorization": myApiKey,
    });
    if (response.statusCode == 200) {
      var rawData = jsonDecode(response.body);
      var data = WallpaperDataModel.fromJson(rawData);
      return data;
    } else {
      return null;
    }
  }

  Future<WallpaperDataModel?> getTrendingWallpaper() async {
    var myApiKey = "lLGZiqQUy25YBe9qTDs7DSbHpO7X72BPg6FkAd9IG0VxSRWbhXg5EirB";
    var uri = Uri.parse("https://api.pexels.com/v1/curated");
    var response = await http.get(uri, headers: {
      "Authorization": myApiKey,
    });
    if (response.statusCode == 200) {
      var rawData = jsonDecode(response.body);
      var data = WallpaperDataModel.fromJson(rawData);
      return data;
    } else {
      return null;
    }
  }
}
