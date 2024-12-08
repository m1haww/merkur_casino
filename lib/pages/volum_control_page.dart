import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VolumeControlPage extends StatefulWidget {
  const VolumeControlPage({super.key});

  @override
  _VolumeControlPageState createState() => _VolumeControlPageState();
}

class _VolumeControlPageState extends State<VolumeControlPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int volume = 50; // Initial volume (50%)
  File? _avatarImage; // To store the picked image

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      await _audioPlayer
          .setAsset('assets/audio/Lukrembo - Biscuit (freetouse.com).mp3');
      _audioPlayer.setVolume(volume / 100); // Set initial volume
      _audioPlayer.play(); // Play the song automatically
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarImage = File(image.path); // Save the image to _avatarImage
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFEEFAD),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Volume Control',
          style: TextStyle(fontFamily: "Belgrano"),
        ),
        backgroundColor: const Color(0xffFEEFAD),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // Avatar section - outside the container
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: _avatarImage != null
                    ? FileImage(_avatarImage!)
                    : const AssetImage('images/avatar.webp') as ImageProvider,
              ),
            ),
            const SizedBox(height: 20),

            // Container for Volume Control and additional functionality
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: double.infinity,
                height: height * 0.4,
                color: const Color(0xffFDDE55),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Music Volume Control
                      Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xffFCC737), // Background color
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Decrease volume button
                              IconButton(
                                icon: const Icon(Icons.volume_down,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (volume > 0) {
                                      volume -= 10;
                                      _audioPlayer.setVolume(volume / 100);
                                    }
                                  });
                                },
                              ),
                              // Slider to adjust volume
                              Expanded(
                                child: Slider(
                                  value: volume.toDouble(),
                                  min: 0,
                                  max: 100,
                                  divisions: 10,
                                  label: "$volume",
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white38,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      volume = newValue.toInt();
                                      _audioPlayer.setVolume(volume / 100);
                                    });
                                  },
                                ),
                              ),
                              // Increase volume button
                              IconButton(
                                icon: const Icon(Icons.volume_up,
                                    color: Colors.white),
                                onPressed: () {
                                  setState(() {
                                    if (volume < 100) {
                                      volume += 10;
                                      _audioPlayer.setVolume(volume / 100);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xffFCC737), // Background color
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Playing Song: Lukrembo - Biscuit",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontFamily: "Belgrano"),
                        ),
                      ),
                      const SizedBox(height: 20), // Space before icons and text
                      // Icons with text near them
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Music Settings Icon with text
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Add functionality for music settings
                                },
                                child: const Icon(
                                  Icons.music_note,
                                  size: 15,
                                  color: Color(0xffFAB12F),
                                ),
                              ),
                              const Text("Good Sound",
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: "Belgrano"))
                            ],
                          ),
                          // Security Icon with text
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Add functionality for security
                                },
                                child: const Icon(
                                  Icons.lock,
                                  size: 15,
                                  color: Color(0xffFAB12F),
                                ),
                              ),
                              const Text("Privacy Policy",
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: "Belgrano"))
                            ],
                          ),
                          // Settings Icon with text
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Add functionality for settings
                                },
                                child: const Icon(
                                  Icons.settings,
                                  size: 15,
                                  color: Color(0xffFAB12F),
                                ),
                              ),
                              const Text("Privacy Policy",
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: "Belgrano"))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
