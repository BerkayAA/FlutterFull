import 'package:flutter/material.dart';
import 'package:master/100/statefull_learn.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({
    Key? key,
    this.isOkey = false,
  }) : super(key: key);
  final bool isOkey;

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //? final Object? incoming = ModalRoute.of(context)?.settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOkey);
          },
          icon: Icon(Icons.done, color: widget.isOkey ? Colors.red : Colors.green),
          label: widget.isOkey ? const Text('Red') : const Text('Onayla'),
        ),
      ),
    );
  }
}