import 'package:flutter/material.dart';
import '../models/video_info.dart';
import 'video_list.dart';

class VideoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  var videos = <VideoInfo>[
    VideoInfo(
      title: 'Butterfly',
      coverImageUrl: 'https://i.vimeocdn.com/video/530125963_640x360.jpg',
      videoImageUrl: 'https://videosprotectiondogs.s3.eu-west-2.amazonaws.com/PuppyFoundation/%2369+Peoples+Motivation+%26+Energy+1+-+Cata+1.mp4',
    ),
    VideoInfo(
      title: 'Big Buck Bunny',
      coverImageUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg',
      videoImageUrl: 'https://videosprotectiondogs.s3.eu-west-2.amazonaws.com/Handler+-+Decoy+Training+(Catagory+7)/%2317+Presenting+Sleeve+live+to+a+Dog+1+-+Cata+7.mp4',
    ),
    VideoInfo(
      title: 'Elephant\'s Dream',
      coverImageUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg',
      videoImageUrl: 'https://videosprotectiondogs.s3.eu-west-2.amazonaws.com/PuppyFoundation/%2362+Teaching+a+Trainer+to+Train+-+Cata+1.mp4',
    ),
    VideoInfo(
      title: 'Test testing Dream',
      coverImageUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg',
      videoImageUrl: 'https://videosprotectiondogs.s3.eu-west-2.amazonaws.com/PuppyFoundation/%2326+Fun+Engagement+1+-+Cata+1.mp4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoList(
        videos: videos,
        onVideoAdded: (video) {
          setState(() => videos.add(video));
        },
        onVideoEdited: (video, index) {
          setState(() => videos[index] = video);
        },
      ),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
      ),
    );
  }
}
