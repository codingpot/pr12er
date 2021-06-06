import 'package:grpc/grpc.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';

class GreeterService extends Pr12erServiceBase {
  @override
  Future<HelloResponse> getHello(ServiceCall call, HelloRequest request) async {
    return HelloResponse()..body = 'Hello, ${request.body}';
  }

  @override
  Future<GetVideosResponse> getVideos(
      ServiceCall call, GetVideosRequest request) async {
    List<Video> videos = <Video>[
      Video(
          id: 1,
          link: "https://youtu.be/L3hz57whyNw",
          numberOfLike: 10,
          presenter: "유재준",
          title: "Generative Adversarial Nets",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/RRwaz0fBQ0Y",
          numberOfLike: 10,
          presenter: "엄태웅",
          title: "Deformable Convolutional Networks",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/_Dp8u97_rQ0",
          numberOfLike: 10,
          presenter: "곽근봉",
          title:
              "Learning Phrase Representations using RNN Encoder-Decoder for Statistical Machine Translation",
          category: Category.CATEGORY_NLP),
      Video(
          id: 1,
          link: "https://youtu.be/1jGr_OFyfa0",
          numberOfLike: 10,
          presenter: "전태균",
          title:
              "Image Super-Resolution using Deep Convolutional Neural Networks",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/V7_cNTfm2i8",
          numberOfLike: 10,
          presenter: "김성훈",
          title: "Playing Atari with Deep Reinforcement Learning",
          category: Category.CATEGORY_UNSPECIFIED),
      Video(
          id: 1,
          link: "https://youtu.be/2wbDiZCWQtY",
          numberOfLike: 10,
          presenter: "서기호",
          title: "Neural Turing Machines",
          category: Category.CATEGORY_UNSPECIFIED),
      Video(
          id: 1,
          link: "https://youtu.be/YF6nLVDlznE",
          numberOfLike: 10,
          presenter: "김승일",
          title: "Deep Photo Style Transfer",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/jbnjzyJDldA",
          numberOfLike: 10,
          presenter: "정동준",
          title:
              "Reverse Classification Accuracy: Predicting Segmentation Performance in the Absence of Ground Truth",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/tOItokBZSfU",
          numberOfLike: 10,
          presenter: "정영재",
          title: "Distilling the Knowledge in a Neural Network",
          category: Category.CATEGORY_UNSPECIFIED),
      Video(
          id: 1,
          link: "https://youtu.be/KYA-GEhObIs",
          numberOfLike: 10,
          presenter: "차준범",
          title: "Auto-Encoding Variational Bayes",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/kcPAGIgBGRs",
          numberOfLike: 10,
          presenter: "이진원",
          title:
              "Faster R-CNN: Towards Real-time Object Detection with Region Proposal Networks",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/n2J7giHrS-Y",
          numberOfLike: 10,
          presenter: "유재준",
          title: "Domain Adversarial Training of Neural Network",
          category: Category.CATEGORY_VISION),
    ];

    GetVideosResponse response = GetVideosResponse(videos: videos);
    print(response);
    return response;
  }

  @override
  Future<GetDetailsResponse> getDetails(
      ServiceCall call, GetDetailsRequest request) {
    // TODO: implement getDetails
    throw UnimplementedError();
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [GreeterService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 9000);
  print('Server listening on port ${server.port}...');
}
