import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final Function handleClose, handleSearch;
  final TextEditingController searchController;
  const SearchWidget(
      {Key? key,
      required this.handleClose,
      required this.handleSearch,
      required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF1E213A),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                color: const Color(0xFFE7E7EB),
                onPressed: () => handleClose(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFE7E7EB),
                          width: 2.0,
                        ),
                      ),
                      labelText: 'New York, Rome...',
                      labelStyle: const TextStyle(
                        color: Color(0xFF616475),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                ElevatedButton(
                  onPressed: () => handleSearch(searchController.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3C47E9),
                    foregroundColor: const Color(0xFFE7E7EB),
                  ),
                  child: Text(
                    'Search',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
