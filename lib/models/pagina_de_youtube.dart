import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class paginadeyoutube extends StatefulWidget {
  final String videoUrl;

  const paginadeyoutube({super.key, required this.videoUrl});

  @override
  _paginadeyoutubeState createState() => _paginadeyoutubeState();
}

class _paginadeyoutubeState extends State<paginadeyoutube> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class PaginaDeYouTube extends StatelessWidget {
  const PaginaDeYouTube({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back when the back arrow is pressed
          },
        ),
        title: const Text(
          'YouTube Videos',
          style: TextStyle(fontFamily: "Belgrano"),
        ),
        backgroundColor: const Color(0xffFEEFAD),
      ),
      backgroundColor: const Color(0xffFEEFAD),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5B4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/soare.webp'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Welcome, dear friend',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Video Section Title
              const Text(
                'Recipes of the Day',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              const Column(
                children: [
                  paginadeyoutube(
                      videoUrl: 'https://www.youtube.com/watch?v=BHcyuzXRqLs'),
                  SizedBox(height: 20),
                  paginadeyoutube(
                      videoUrl: 'https://www.youtube.com/watch?v=N2G6YNtLUOg'),
                  SizedBox(height: 20),
                  paginadeyoutube(
                      videoUrl: 'https://www.youtube.com/watch?v=mhDJNfV7hjk'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
