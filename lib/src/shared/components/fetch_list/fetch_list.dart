import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../style/texts/text_center.dart';
import '../../services/fetch_store/fetch_store.dart';

class FetchList<T> extends StatelessWidget {
  final FetchStore<List<T>> fetchStore;
  final Function itemBuilder;

  const FetchList({
    required this.fetchStore,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (fetchStore.isFetching) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          );
        }

        if (fetchStore.data.isEmpty) {
          return Center(
            child: Text(
              '#Nenhum resultado',
              style: textCenter,
            ),
          );
        }
        return ListView.builder(
          itemCount: fetchStore.data.length,
          itemBuilder: (context, index) {
            return itemBuilder(fetchStore.data[index]);
          },
        );
      },
    );
  }
}
