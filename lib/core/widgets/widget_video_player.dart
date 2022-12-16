import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class WidgetVideoPlayer extends StatefulWidget {
  final String video;

  const WidgetVideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  _WidgetVideoPlayerState createState() => _WidgetVideoPlayerState();
}

class _WidgetVideoPlayerState extends State<WidgetVideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.video);

    chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: _controller.value.aspectRatio,
      autoInitialize: true,
    );

    super.initState();
  }

  // void _onClickPlay() {
  //   setState(() {
  //     _controller.value.isPlaying ? _controller.pause() : _controller.play();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewieController.dispose();
  }
}
