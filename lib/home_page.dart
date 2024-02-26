import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final image1 = 'assets/images/image1.jpeg';
  final image2 = 'assets/images/image2.jpeg';
  final image3 = 'assets/images/image3.jpeg';
  String image = 'assets/images/image1.jpeg';
  final imageList = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg'
  ];

  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // var url = Uri.parse('https://youtu.be/mm4cbjLdzkc');
    // _controller = VideoPlayerController.asset('assets/video.mp4');
    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.setLooping(true);
    // _controller.initialize().then((_) => setState(() {}));

    // _controller.play();
    _startChange();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: IndexedStack(
            key: ValueKey<int>(index),
            index: index,
            children: const [
              FadeInImage(
                placeholder: AssetImage('assets/images/image1.jpeg'),
                image: NetworkImage(
                  'https://i.pinimg.com/564x/f8/22/ac/f822acdf21a23cf5be959b14e86614a8.jpg',
                ),
                fit: BoxFit.cover,
              ),
              FadeInImage(
                placeholder: AssetImage('assets/images/image1.jpeg'),
                image: NetworkImage(
                  'https://i.pinimg.com/564x/94/45/96/94459697d434c2198f434a26d0c749d4.jpg',
                ),
                fit: BoxFit.cover,
              ),
              FadeInImage(
                placeholder: AssetImage('assets/images/image1.jpeg'),
                image: NetworkImage(
                  'https://i.pinimg.com/564x/83/7e/d2/837ed25fa9ff380bafb4bcb5e25360be.jpg',
                ),
                fit: BoxFit.cover,
              ),
              // Image.asset(
              //   'assets/images/image1.jpeg',
              //   fit: BoxFit.cover,
              // ),
              // Image.asset(
              //   'assets/images/image2.jpeg',
              //   fit: BoxFit.cover,
              // ),
              // Image.asset(
              //   'assets/images/image3.jpeg',
              //   fit: BoxFit.cover,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           padding: const EdgeInsets.only(top: 20.0),
  //         ),
  //         const Text('With assets mp4'),
  //         Container(
  //           padding: const EdgeInsets.all(20),
  //           child: AspectRatio(
  //             aspectRatio: _controller.value.aspectRatio,
  //             child: Stack(
  //               alignment: Alignment.bottomCenter,
  //               children: <Widget>[
  //                 VideoPlayer(_controller),
  //                 VideoProgressIndicator(_controller, allowScrubbing: true),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future<void> _startChange() async {
    await Future<void>.delayed(const Duration(seconds: 4)).whenComplete(
      () => _changeImage(),
    );
  }

  void _changeImage() {
    var currentIndex = ++index;
    if (currentIndex >= 3) {
      currentIndex = 0;
    }
    setState(() {
      index = currentIndex;
    });

    _startChange();
  }
}
