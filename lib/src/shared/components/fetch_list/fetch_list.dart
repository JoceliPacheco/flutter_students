import 'package:flutter/material.dart';

import '../../style/texts/text_center.dart';

class FetchList<T> extends StatelessWidget {
  final List<T> list;
  final Function cardList;
  const FetchList({
    required this.list,
    required this.cardList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: Text(
          '#Nenhum resultado',
          style: textCenter,
        ),
      );
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return cardList(list[index]);
      },
    );
  }
}
