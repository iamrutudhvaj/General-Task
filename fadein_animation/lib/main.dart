import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade In Animation"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
            itemCount: imageList.length,
            itemBuilder: (_, int index) {
              final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animationController,
                  curve: Interval((1 / imageList.length) * index, 1.0,
                      curve: Curves.fastOutSlowIn),
                ),
              );
              animationController.forward();
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: HomeListView(
                  animation: animation,
                  animationController: animationController,
                  imagePath: imageList[index],
                ),
              );
            }),
      ),
    );
  }
}

List<String> imageList = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
  "assets/images/4.jpg",
];

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key key, this.imagePath, this.animationController, this.animation})
      : super(key: key);

  final String imagePath;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
