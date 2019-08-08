import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/counter.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 200),
          child: Provide<Counter>(builder: (context, child, counter) {
            return Text(
              '${counter.val}',
              style: Theme.of(context).textTheme.display1,
            );
          }),
        ),
      ),
    );
  }
}
