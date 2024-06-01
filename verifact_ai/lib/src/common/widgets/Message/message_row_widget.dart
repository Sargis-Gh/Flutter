import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserMessageRowWidget extends StatelessWidget {
  final String message;
  const UserMessageRowWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary.withAlpha(30),
          ),
          child: GestureDetector(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
  }
}

class AiAnswerPromtDataWidget extends StatelessWidget {
  const AiAnswerPromtDataWidget({
    super.key,
    required this.imageUrl,
    required this.message,
  });

  final String imageUrl;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withAlpha(30),
        ),
        child: Column(
          children: [
            Text(message),
            const SizedBox(height: 5),
            Image.network(
              imageUrl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Խնդրում ենք կրկին փորձել');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AiAnswerResultDataWidget extends StatelessWidget {
  final String title;
  final String url;
  final List<dynamic> percent;
  const AiAnswerResultDataWidget({
    super.key,
    required this.title,
    required this.url,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withAlpha(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextRowWidget(message: title),
            const SizedBox(height: 10),
            TextLinkWidget(message: url),
            const SizedBox(height: 10),
            TextRowWidget(message: percent[1]),
            const SizedBox(height: 10),
            TextRowWidget(message: percent[2]),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class TextLinkWidget extends StatefulWidget {
  final String message;
  const TextLinkWidget({super.key, required this.message});

  @override
  State<TextLinkWidget> createState() => _TextLinkWidgetState();
}

class _TextLinkWidgetState extends State<TextLinkWidget> {
  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw "Կայքը չի գտնվել";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(widget.message);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withAlpha(30),
        ),
        child: Text(
          widget.message,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

class TextRowWidget extends StatelessWidget {
  final String message;
  const TextRowWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary.withAlpha(30),
      ),
      child: Text(
        message,
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextPercentWidget extends StatelessWidget {
  final String message;
  const TextPercentWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withAlpha(30),
        ),
        child: Text(
          'Վերջնական արդյունք $message%',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final String message;
  final bool isConfirm;

  const HeaderWidget({
    super.key,
    required this.message,
    required this.isConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withAlpha(30),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isConfirm ? Colors.green : Colors.black,
          ),
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
