import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/core.dart';
import 'package:movie_app/src/features/movie_detail/domain/domain.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../common/common.dart';

class MovieVideoScreen extends StatefulWidget {
  const MovieVideoScreen({
    super.key,
    required this.movieVideoArguments,
  });

  final MovieVideoArguments movieVideoArguments;

  @override
  State<MovieVideoScreen> createState() => _MovieVideoScreenState();
}

class _MovieVideoScreenState extends State<MovieVideoScreen> {
  late List<MovieVideoEntity> _videos;
  late YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    super.initState();
    _videos = widget.movieVideoArguments.videos;
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MovieAppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: Sizes.dimen_20.h,
              ),
            ),
            title: Text(
              TranslationConstants.WATCH_TRAILERS.translate(context)!,
            ),
          ),
          Expanded(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _youtubePlayerController,
                aspectRatio: 16 / 9,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.redAccent,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              builder: (context, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: child,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          for (int i = 0; i < _videos.length; i++)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.dimen_16.w,
                                vertical: Sizes.dimen_16.h,
                              ),
                              child: Container(
                                height: Sizes.dimen_120.h,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _youtubePlayerController
                                            .load(_videos[i].key);
                                        _youtubePlayerController.play();
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Sizes.dimen_10.w),
                                        child: CachedNetworkImage(
                                          width: Sizes.dimen_200.w,
                                          fit: BoxFit.cover,
                                          imageUrl: YoutubePlayer.getThumbnail(
                                            videoId: _videos[i].key,
                                            quality: ThumbnailQuality.high,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Sizes.dimen_8.w,
                                        ),
                                        child: Text(
                                          _videos[i].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ]),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
