import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({
    super.key,
  });

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Կարգավորումներ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          // const Text(
          //   '  Անձնական',
          // ),
          // const SizedBox(height: 5),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).colorScheme.primary,
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: const Row(
          //     children: [
          //       Icon(
          //         Icons.email_outlined,
          //         size: 20,
          //         color: Colors.white,
          //       ),
          //       SizedBox(width: 5),
          //       Text(
          //         'Էլ. հասցե',
          //         style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w300,
          //             color: Colors.white),
          //       ),
          //       SizedBox(width: 20),
          //       // Text(
          //       //   // widget.email,
          //       //   style: const TextStyle(fontSize: 15, color: Colors.white),
          //       // ),
          //     ],
          //   ),
          // ),

          // const SizedBox(height: 30),
          // ElevatedButton(
          //   style: ButtonStyle(
          //       backgroundColor: WidgetStatePropertyAll(
          //           Theme.of(context).colorScheme.primary)),
          //   onPressed: () {
          //     _logout(context);
          //   },
          //   child: const Text(
          //     'Դուրս գալ',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // )
        ],
      ),
    );
  }
}
