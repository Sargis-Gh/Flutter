import 'package:flutter/material.dart';
import 'package:verifactai/src/common/data/chat/aianswer.dart';
import 'package:verifactai/src/common/data/chat/chat.dart';
import 'package:verifactai/src/common/data/memory_manager.dart';
import 'package:verifactai/src/common/widgets/Message/message_row_widget.dart';

class MessageProvider extends ChangeNotifier {
  final List<Widget> _history = [];
  List<Widget> get history => List.unmodifiable(_history);
  Future<void> addMessage(Widget message) async {
    _history.add(message);
    notifyListeners();
  }

  void deleteHistory() {
    _history.clear();
    notifyListeners();
  }

  Future<void> send(String link) async {
    final String result = await MemoryManager.getfullName();
    final String fullName = result;
    final AiAnswer answer = await Chat.send(link, fullName);

    if (answer.success == 'false') {
      const HeaderWidget error = HeaderWidget(
        message: 'Խնդրում ենք կրկին փորձել:',
        isConfirm: false,
      );
      await addMessage(error);
    } else {
      final Map<String, dynamic> promptData = answer.promptData;
      final List<dynamic> resultData = answer.resultData;

      final List<dynamic> anyNewsResultData = answer.anyNewsResultData;
      // final dynamic overallResult = answer.overallResult;

      final List<AiAnswerResultDataWidget> listResults = [];
      for (Map<String, dynamic> result in resultData) {
        final String title = result['title'];
        final String url = result['url'];
        final Map<String, dynamic> percent = result['percent'];
        final List<dynamic> percentData = [
          percent['similarityPercent'],
          percent['similarity'],
          percent['difference'],
        ];
        listResults.add(
          AiAnswerResultDataWidget(
            title: title,
            url: url,
            percent: percentData,
          ),
        );
      }
      final List<AiAnswerResultDataWidget> listAnyNewsResultData = [];
      for (Map<String, dynamic> result in anyNewsResultData) {
        final String title = result['title'];
        final String url = result['url'];
        final Map<String, dynamic> percent = result['percent'];
        final List<dynamic> percentData = [
          percent['similarityPercent'],
          percent['similarity'],
          percent['difference'],
        ];
        listAnyNewsResultData.add(AiAnswerResultDataWidget(
          title: title,
          url: url,
          percent: percentData,
        ));
      }
      final AiAnswerPromtDataWidget prompt = AiAnswerPromtDataWidget(
          imageUrl: promptData['image'], message: promptData['title']);

      await addMessage(prompt);
      for (AiAnswerResultDataWidget result in listResults) {
        await addMessage(result);
      }
      for (AiAnswerResultDataWidget result in listAnyNewsResultData) {
        await addMessage(result);
      }
    }
  }

  String _message = '';
  String get message => _message;
  set message(String value) {
    _message = value;
    notifyListeners();
  }
}
