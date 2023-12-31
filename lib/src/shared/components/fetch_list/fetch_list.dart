import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

        if (fetchStore.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noError,
              style: textCenter,
            ),
          );
        }

        if (fetchStore.data.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noResult,
              style: textCenter,
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 48),
          itemCount: fetchStore.data.length,
          itemBuilder: (context, index) {
            return itemBuilder(fetchStore.data[index]);
          },
        );
      },
    );
  }
}
