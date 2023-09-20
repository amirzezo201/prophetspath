import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:prophetspath/models/kidsvideos_model.dart';
import 'package:prophetspath/services/api/kids_api.dart';
import 'package:prophetspath/utils/app_style.dart';
import 'package:video_player/video_player.dart';

class KidsVideos extends StatefulWidget {
  const KidsVideos({super.key});
  static String routeName = "/kids";

  @override
  State<KidsVideos> createState() => _KidsVideosState();
}

class _KidsVideosState extends State<KidsVideos> {
  late List<KidsVideoModel>? _kidsModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _kidsModel = (await VideoApi().getKidsVideos())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        title: const Text(
          "Empowering Kids",
          style: TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppStyle.darkblue,
            )),
      ),
      body: _kidsModel == null || _kidsModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: AppStyle.primaryColor,
              ),
            )
          : ListView.builder(
              itemCount: _kidsModel!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _MoviePlayer(
                          kidsvidePlayer: _kidsModel![index].video,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 25),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(ApiConstants.baseUrl +
                                        _kidsModel![index].videothumbnail),
                                  )),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _kidsModel![index].name,
                                  style: const TextStyle(
                                      color: AppStyle.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Text(_kidsModel![index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _MoviePlayer extends StatefulWidget {
  const _MoviePlayer({
    Key? key,
    required this.kidsvidePlayer,
  }) : super(key: key);

  final String kidsvidePlayer;

  @override
  State<_MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.network(
        ApiConstants.baseUrl + widget.kidsvidePlayer)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
    Future.delayed(const Duration(seconds: 5)).then((value) {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Chewie(controller: chewieController),
      ),
    );
  }
}
