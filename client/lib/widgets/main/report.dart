import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/service.pb.dart';

const String reportTextPlaceholder = 'PR 넘버: ...\nYouTube 링크: ...\n';

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key}) : super(key: key);

  @override
  _ReportWidgetState createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  final _reportTextFieldController = TextEditingController();
  ReportRequest_ReportType currentReportType =
      ReportRequest_ReportType.REPORT_TYPE_MISSING_PR_VIDEO;

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
        indent: 20,
        endIndent: 20,
        thickness: 2,
        color: Theme.of(context).accentColor,
      ),
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: DropdownButton<ReportRequest_ReportType>(
          value: currentReportType,
          onChanged: (newValue) {
            setState(() {
              currentReportType = newValue!;
            });
          },
          isExpanded: true,
          underline: Container(
            height: 2,
          ),
          style: Theme.of(context).textTheme.headline6,
          items: ReportRequest_ReportType.values
              .map((ReportRequest_ReportType reportType) {
            return DropdownMenuItem<ReportRequest_ReportType>(
              value: reportType,
              child: Text(getStringReportTypeBy(reportType)),
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
            icon: const Icon(
              Icons.outbox,
              size: 30,
            ),
            label: Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text('제보 보내기',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .apply(color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ))
        ]),
      ),
      const SizedBox(
        height: 200,
      ),
    ]);
  }

  String getStringReportTypeBy(ReportRequest_ReportType reportType) {
    switch (reportType) {
      case ReportRequest_ReportType.REPORT_TYPE_MISSING_PR_VIDEO:
        {
          return "PR12 누락 동영상";
        }

      case ReportRequest_ReportType.REPORT_TYPE_BUG:
        {
          return "버그";
        }

      default:
        {
          // equivalent to ReportRequest_ReportType.REPORT_TYPE_UNSPECIFIED
          return "기타";
        }
    }
  }
}
