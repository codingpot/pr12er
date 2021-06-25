import 'package:flutter/material.dart';

const List<String> reportPreset = ['누락된 PR12 동영상 제보', '기타 이슈'];
const String reportTextPlaceholder = 'PR 넘버: ...\nYouTube 링크: ...\n';

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  final _reportTextFieldController = TextEditingController();
  String reportCategory = reportPreset[0];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const SizedBox(
        height: 15,
      ),
      ListTile(
        title: Text('이슈 리포트',
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.apply(fontWeightDelta: 5)),
        leading:
            Icon(Icons.report, size: 30, color: Theme.of(context).accentColor),
      ),
      Divider(
        indent: 10,
        endIndent: 10,
        height: 15,
        color: Theme.of(context).accentColor,
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: DropdownButton(
          value: reportCategory,
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              reportCategory = newValue!;
            });
          },
          underline: Container(
            height: 2,
            color: Theme.of(context).accentColor,
          ),
          style: Theme.of(context).textTheme.headline6,
          items: reportPreset.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: _reportTextFieldController,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 5,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '제보 내용을 입력해 주세요',
                hintMaxLines: 3,
                hintText: reportTextPlaceholder),
          )),
      const SizedBox(
        height: 20,
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(children: [
          Expanded(
              child: ElevatedButton.icon(
            onPressed: () {
              // send report action
            },
            icon: Icon(Icons.outbox,
                size: 30, color: Theme.of(context).primaryIconTheme.color),
            label: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child:
                  Text('제보 보내기', style: Theme.of(context).textTheme.headline6),
            ),
          ))
        ]),
      ),
      const SizedBox(
        height: 200,
      ),
    ]);
  }
}
