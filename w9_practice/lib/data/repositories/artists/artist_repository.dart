import 'package:w9_practice/model/artists/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtist();
}
