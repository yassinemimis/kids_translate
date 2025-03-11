import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicProvider with ChangeNotifier {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  MusicProvider() {
    _audioPlayer = AudioPlayer();
  }

 Future<void> playMusic() async {
  if (!_isPlaying) {
    try {
      await _audioPlayer.setSource(AssetSource('background_music.mp3'));
      await _audioPlayer.resume();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print("Error playing music: $e");
    }
  }
}



  Future<void> pauseMusic() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      _isPlaying = false;
      notifyListeners();
    }
  }

  bool get isPlaying => _isPlaying;
}
