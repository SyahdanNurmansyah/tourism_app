import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoWidget extends StatefulWidget {
  const CupertinoWidget({super.key});

  @override
  State<CupertinoWidget> createState() => _CupertinoWidgetState();
}

class _CupertinoWidgetState extends State<CupertinoWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Navigation Bar'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        trailing: Icon(CupertinoIcons.ellipsis),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CupertinoNavigationBar example',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const Spacer(),
            const SizedBox(height: 24),
            CupertinoButton.filled(
              onPressed: () {},
              child: Text('Cupertino Filled Button'),
            ),
            CupertinoButton(onPressed: () {}, child: Text('Cupertino Button')),
          ],
        ),
      ),
    );
  }
}
