import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();

  final List<String> data = [
    "Google",
    "Microsoft",
    "Apple",
    "Amazon",
    "Nvidia",
    "Meta",
    "Intel",
  ];

  List<String> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = data; 
  }

  void _search(String query) {
    setState(() {
      filtered = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: controller,
          autofocus: true,
          onChanged: _search,
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),

      body: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filtered[index]),
            leading: const Icon(Icons.business),
          );
        },
      ),
    );
  }
}
