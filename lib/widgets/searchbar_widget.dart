import 'package:closet_assist/provider/search_query_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQueryProvider = Provider.of<SearchQueryProvider>(context);
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      onChanged: (query) {
        searchQueryProvider.searchQuery = query;
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        hintText: 'Search Fitfolio',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
