import 'package:grpc/grpc.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/protos/google/protobuf/timestamp.pb.dart';

import 'protos/pkg/pr12er/service.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

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
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "유재준",
          title: "Generative Adversarial Nets",
          category: Category.CATEGORY_VISION,
          publishedDate: Timestamp()..seconds = Int64(1492300850)),
      Video(
          id: 1,
          link: "https://youtu.be/RRwaz0fBQ0Y",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "엄태웅",
          title: "Deformable Convolutional Networks",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/_Dp8u97_rQ0",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "곽근봉",
          title:
              "Learning Phrase Representations using RNN Encoder-Decoder for Statistical Machine Translation",
          category: Category.CATEGORY_NLP),
      Video(
          id: 1,
          link: "https://youtu.be/1jGr_OFyfa0",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "전태균",
          title:
              "Image Super-Resolution using Deep Convolutional Neural Networks",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/V7_cNTfm2i8",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "김성훈",
          title: "Playing Atari with Deep Reinforcement Learning",
          category: Category.CATEGORY_UNSPECIFIED),
      Video(
          id: 1,
          link: "https://youtu.be/2wbDiZCWQtY",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "서기호",
          title: "Neural Turing Machines",
          category: Category.CATEGORY_UNSPECIFIED),
      Video(
          id: 1,
          link: "https://youtu.be/YF6nLVDlznE",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "김승일",
          title: "Deep Photo Style Transfer",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/jbnjzyJDldA",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "정동준",
          title:
              "Reverse Classification Accuracy: Predicting Segmentation Performance in the Absence of Ground Truth",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/tOItokBZSfU",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "정영재",
          title: "Distilling the Knowledge in a Neural Network",
          category: Category.CATEGORY_UNSPECIFIED),
      Video(
          id: 1,
          link: "https://youtu.be/KYA-GEhObIs",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "차준범",
          title: "Auto-Encoding Variational Bayes",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/kcPAGIgBGRs",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
          presenter: "이진원",
          title:
              "Faster R-CNN: Towards Real-time Object Detection with Region Proposal Networks",
          category: Category.CATEGORY_VISION),
      Video(
          id: 1,
          link: "https://youtu.be/n2J7giHrS-Y",
          numberOfLike: Int64(10),
          numberOfViews: Int64(100),
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
      ServiceCall call, GetDetailsRequest request) async {
    // TODO: implement getDetails
    final response = GetDetailsResponse(
        detail: Detail(paper: <Paper>[
      Paper(
          absract:
              "We propose a new framework for estimating generative models via an adversarial process, in which we simultaneously train two models: a generative model G that captures the data distribution, and a discriminative model D that estimates the probability that a sample came from the training data rather than G. The training procedure for G is to maximize the probability of D making a mistake. This framework corresponds to a minimax two-player game. In the space of arbitrary functions G and D, a unique solution exists, with G recovering the training data distribution and D equal to 1/2 everywhere. In the case where G and D are defined by multilayer perceptrons, the entire system can be trained with backpropagation. There is no need for any Markov chains or unrolled approximate inference networks during either training or generation of samples. Experiments demonstrate the potential of the framework through qualitative and quantitative evaluation of the generated samples.",
          repositories: <Repository>[
            Repository(
              framework: Framework.FRAMEWORK_TENSORFLOW,
              owner: "goodfeli",
            ),
            Repository(
              framework: Framework.FRAMEWORK_PYTORCH,
              owner: "eriklindernoren",
            ),
            Repository(
                framework: Framework.FRAMEWORK_TENSORFLOW,
                owner: "google-research"),
            Repository(
                framework: Framework.FRAMEWORK_PYTORCH,
                owner: "eriklindernoren")
          ])
    ], sameAuthorPapers: <Paper>[
      Paper(
          title:
              "On distinguishability criteria for estimating generative models",
          authors: <String>["Ian J. Goodfellow"],
          pubDate: Timestamp(seconds: Int64(1432189960)))
    ], relevantPapers: <Paper>[
      Paper(
        title:
            "Learning to Efficiently Sample from Diffusion Probabilistic Models",
        authors: <String>["Daniel Watson"],
        pubDate: Timestamp(seconds: Int64(1623047560)),
      )
    ]));

    print(response);

    return response;
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
