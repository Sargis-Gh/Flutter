class AiAnswer {
  final Map<String, dynamic> promptData;
  final List<dynamic> resultData;
  final List<dynamic> anyNewsResultData;
  final String success;
  // final String overallResult;

  AiAnswer({
    required this.success,
    required this.promptData,
    required this.resultData,
    required this.anyNewsResultData,
    // required this.overallResult,
  });
}

class ResultData {
  final String title;
  final String url;
  final Map<String, dynamic> percent;

  ResultData({
    required this.title,
    required this.url,
    required this.percent,
  });
}

class Percent {
  final String similarityPercent;
  final String similarity;
  final String difference;

  Percent({
    required this.similarityPercent,
    required this.similarity,
    required this.difference,
  });
}
