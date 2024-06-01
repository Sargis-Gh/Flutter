import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/common/widgets/Message/message_row_widget.dart';
import 'package:verifactai/src/features/home/providers/user_provider.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({
    super.key,
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  String sendMessage = '';
  bool sending = false; // Added state for tracking sending process

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);
    final TextEditingController messageTextcontroler =
        TextEditingController();
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary.withAlpha(50),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 30, top: 10, bottom: 15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageTextcontroler,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  hintText: 'Հղում...',
                ),
                onChanged: (value) {
                  sendMessage = value;
                },
              ),
            ),
            sending
                ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ) // Loading animation while sending
                : IconButton(
                    icon: const Icon(
                      // color: Theme.of(context).colorScheme.primary,
                      Icons.send,
                    ),
                    onPressed: () async {
                      if (messageTextcontroler.text != '') {
                        setState(() {
                          sending = true; // Start sending process
                        });
                        final message =
                            UserMessageRowWidget(message: sendMessage);
                        messageProvider.addMessage(message);
                        await messageProvider.send(sendMessage);
                        messageTextcontroler.clear();
                        setState(() {
                          sending = false; // End sending process
                        });
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

