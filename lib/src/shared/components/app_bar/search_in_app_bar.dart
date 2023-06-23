import 'package:flutter/material.dart';

class SearchInAppBar extends StatelessWidget {
  final Function onSearch;

  SearchInAppBar({
    required this.onSearch,
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          hintText: 'Busca...',
          suffix: IconButton(
              onPressed: () {
                controller.clear();
                onSearch('');
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(
                Icons.clear,
              ))),
      onFieldSubmitted: (value) => onSearch(value),
    );
  }
}
