import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w9_practice/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice/ui/screens/artist/view_model/artist_view_model.dart';
import 'package:w9_practice/ui/screens/artist/widgets/artist_content.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: ArtistContent(),
      create: (context) {
        return ArtistViewModel(
          artistRepository: context.read<ArtistRepository>(),
        );
      },
    );
  }
}
