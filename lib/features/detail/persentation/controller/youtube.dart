// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// // StateNotifier untuk mengelola YoutubePlayerController
// class YoutubeControllerNotifier
//     extends StateNotifier<YoutubePlayerController?> {
//   YoutubeControllerNotifier() : super(null);

//   void init(String videoId) {
//     final controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );

//     // Add listener untuk mendeteksi perubahan state
//     controller.addListener(() {
//       // Deteksi apakah masuk atau keluar dari fullscreen
//       if (controller.value.isFullScreen) {
//         // Fullscreen mode
//         print("Video is in fullscreen mode");
//       } else {
//         // Normal mode
//         print("Video exited fullscreen mode");
//       }
//     });

//     state = controller; // Set state ke controller
//   }

//   void disposeController() {
//     state?.dispose();
//   }
// }

// // Provider untuk mengakses YoutubeControllerNotifier
// final youtubeControllerProvider =
//     StateNotifierProvider<YoutubeControllerNotifier, YoutubePlayerController?>(
//   (ref) => YoutubeControllerNotifier(),
// );
