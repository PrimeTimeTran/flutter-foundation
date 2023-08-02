import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeedScreen extends StatefulWidget {
  const SeedScreen({super.key});

  @override
  State<SeedScreen> createState() => _SeedScreenState();
}

class _SeedScreenState extends State<SeedScreen> {
  List<dynamic> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seed Screen'),
      ),
      body: itemList.isNotEmpty
          ? ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return ListTile(
                  title: Text(item['firstName'] ?? ''),
                  subtitle: Text(item['email'] ?? ''),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    const url =
        'http://localhost:8080/api/tenant/9406000e-015c-4706-8158-8058f6695330/investor';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjNmNGZmYzRlLTU5MWQtNGJmMy04ZGJjLTc0MTM1ZjQ5YzAwNyIsImlhdCI6MTY5Mjk2OTA0MiwiZXhwIjoxNjkzNTczODQyfQ.8owt_Oa21122E-jKBnXlNNZNF3Opa8RY97-s2Q5vjlg';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final parsedResponse = json.decode(response.body);
        final rows = parsedResponse['rows'] as List<dynamic>;

        setState(() {
          itemList = rows;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
