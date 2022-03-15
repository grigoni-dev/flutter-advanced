import 'package:progetto1/model/sliver_show_display_model.dart';
import 'package:progetto1/model/sliver_show_model.dart';

class SliverShowSectionModel {
  final SliverShowDisplayMode displayMode;
  final List<SliverShowModel> shows;

  SliverShowSectionModel({required this.displayMode, required this.shows});

  static final sliverShows = [
    SliverShowSectionModel(
      displayMode: SliverShowDisplayMode.list,
      shows: [
        SliverShowModel(
          label: "Friends",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/friends.webp",
        ),
        SliverShowModel(
          label: "How I Met Your Mother",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/how_i_met_your_mother.webp",
        ),
        SliverShowModel(
          label: "Girls",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/girls.webp",
        ),
      ],
    ),
    SliverShowSectionModel(
      displayMode: SliverShowDisplayMode.grid,
      shows: [
        SliverShowModel(
          label: "Scopri",
        ),
        SliverShowModel(
          label: "Di",
        ),
        SliverShowModel(
          label: "Più",
        ),
      ],
    ),
    SliverShowSectionModel(
      displayMode: SliverShowDisplayMode.list,
      shows: [
        SliverShowModel(
          label: "Chuck",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/chuck.webp",
        ),
        SliverShowModel(
          label: "Matrix",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/matrix.webp",
        ),
        SliverShowModel(
          label: "Harry Potter",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/harry_potter.webp",
        ),
        SliverShowModel(
          label: "Breaking Bad",
          description:
              "In non proident excepteur non anim laboris. Magna in enim Lorem aliquip minim in proident deserunt nulla.",
          backgroundImage: "assets/images/breaking_bad.webp",
        ),
      ],
    ),
  ];
}
