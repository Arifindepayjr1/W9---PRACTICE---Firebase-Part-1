import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w9_practice/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice/data/repositories/artists/artist_repository_firebase.dart';
import 'package:w9_practice/model/artists/artist.dart';

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'w9-practice-4a4bf-default-rtdb.firebaseio.com',
    '/songs.json',
  );

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs

      final Map<String, dynamic> songs =
          json.decode(response.body) as Map<String, dynamic>;

      return songs.entries.map((element) {
        final String id = element.key;
        return SongDto.fromJson({'id': id, ...element.value});
      }).toList();
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    return null;
  }
}
