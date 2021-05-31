import 'package:flutter/material.dart';
import 'detail.dart';
import 'service.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.search),
            title: Text('pr12errrrrrrrrrrrrrrrrrrr'),
          ),
          body: Client()),
    );
  }
}

class Client extends StatefulWidget {
  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<Client> {
  List<Video> videos = [];
  final myController = TextEditingController();

  Future<List<Video>> _fetchListItems() async {
    List<Video> videos = await GrpcMsgSender().getVideos();
    return videos;
  }

  List<Widget> getCategoryWidgets(Category category) {
    switch (category) {
      case Category.CATEGORY_VISION:
        return [Icon(Icons.remove_red_eye), Text('CV')];
      case Category.CATEGORY_NLP:
        return [Icon(Icons.translate), Text('NLP')];
      case Category.CATEGORY_AUDIO:
        return [Icon(Icons.graphic_eq), Text('AUDIO')];
      case Category.CATEGORY_RS:
        return [Icon(Icons.assistant), Text('RS')];
      case Category.CATEGORY_OCR:
        return [Icon(Icons.text_fields), Text('OCR')];
      case Category.CATEGORY_UNSPECIFIED:
      default:
        return [Icon(Icons.grid_view), Text('ETC')];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchListItems(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return getTile(index,
                    title: snapshot.data[index].title,
                    presenter: snapshot.data[index].presenter,
                    keyword: "현재 키워드 지원(X)",
                    category: snapshot.data[index].category,
                    url: snapshot.data[index].link);
              });
        });
  }

  Widget getTile(int index,
      {String title = "",
      String presenter = "",
      String keyword = "",
      Category category = Category.CATEGORY_UNSPECIFIED,
      String url = ""}) {
    return Card(
      child: ListTile(
        leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getCategoryWidgets(category)),
        title: Text('${title}'),
        subtitle: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(children: [
              Column(children: [Text(presenter)]),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(children: [
                    Text(
                      keyword,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ]))
            ])),
        trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.favorite_border_outlined)]),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailApp(url),
            ),
          );
        },
      ),
    );
  }
}
