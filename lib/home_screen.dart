import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jokes_about_chuck/dummy_body.dart';
import 'package:jokes_about_chuck/joke_model.dart';
import 'package:jokes_about_chuck/joke_text.dart';

Dio dio = Dio();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Joke? jokeData;
  bool isLoading = false;

  void updateJoke() async {
    const url = 'https://api.chucknorris.io/jokes/random';
    setState(() {
      isLoading = true;
    });
    final response = await dio.get(url);
    if (response.data is Map<String, dynamic>) {
      setState(() {
        jokeData = Joke.fromJson(response.data);
        isLoading = false;
      });
    }
  }

  double bottomSheetHeight(BuildContext context) => 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chuck Norris Jokes'),
      ),
      body: SafeArea(
        child: jokeData == null
            ? DummyBody(
                bottomShitHeight: bottomSheetHeight(context),
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      if (jokeData!.value != null)
                        JokeText(joke: jokeData!.value),
                    ],
                  ),
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Get next joke',
        child: Icon(
          jokeData == null ? Icons.play_arrow : Icons.skip_next,
          color: Colors.grey,
        ),
        onPressed: updateJoke,
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            color: Colors.black,
            height: bottomSheetHeight(context),
          ),
          if (isLoading) LinearProgressIndicator()
        ],
      ),
    );
  }
}
