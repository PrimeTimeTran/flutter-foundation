import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InvestorsScreen extends StatefulWidget {
  const InvestorsScreen({super.key});

  @override
  State<InvestorsScreen> createState() => _InvestorsScreenState();
}

class _InvestorsScreenState extends State<InvestorsScreen> {
  List<dynamic> itemList = [];
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investors'),
      ),
      body: itemList.isNotEmpty
          ? ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return ListTile(
                  title: Text(item['name'] ?? ''),
                  subtitle: Text(item['email'] ?? ''),
                );
              },
            )
          : Center(
              child: error
                  ? const Text('Error')
                  : const CircularProgressIndicator(),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    const url = '';
    const token = '';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.body[0] != '<') {
        final parsedResponse = json.decode(response.body);
        final rows = parsedResponse['rows'] as List<dynamic>;

        setState(() {
          itemList = rows;
        });
      } else {
        setState(() {
          error = true;
        });
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
