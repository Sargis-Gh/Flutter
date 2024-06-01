import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verifactai/src/features/home/providers/drawer_provider.dart';

class DomainWidget extends StatefulWidget {
  const DomainWidget({super.key});

  @override
  State<DomainWidget> createState() => _DomainWidgetState();
}

class _DomainWidgetState extends State<DomainWidget> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    final List<String> domains = drawerProvider.domains;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemCount: domains.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: DomainNameWidget(domaniName: domains[index]),

        );
      },
    );
    // return Slidable(
    //   // Specify a key if the Slidable is dismissible.
    //   key: ValueKey(0),

    //   // The start action pane is the one at the left or the top side

    //   // The end action pane is the one at the right or the bottom side.
    //   endActionPane: const ActionPane(
    //     motion: ScrollMotion(),
    //     children: [
    //       SlidableAction(
    //         onPressed: null,
    //         backgroundColor: Color(0xFFFE4A49),
    //         foregroundColor: Colors.white,
    //         icon: Icons.delete,
    //         label: 'Delete',
    //       ),
    //     ],
    //   ),

    //   // The child of the Slidable is what the user sees when the
    //   // component is not dragged.
    //   // child: ListTile(title: Text('Slide me')),
    //   child: DomainNameWidget(domaniName: domains.first),
    // );
  
  }
}

class DomainNameWidget extends StatelessWidget {
  final String domaniName;
  const DomainNameWidget({
    super.key,
    required this.domaniName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(domaniName),
        ],
      ),
    );
  }
}
