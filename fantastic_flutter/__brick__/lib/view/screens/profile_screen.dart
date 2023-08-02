import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Investor {
  List<String> status;
  List<String> onboardStatuses;
  List<String> transfers;
  List<String> orders;
  List<String> funds;
  List<String> beneficiaries;
  List<String> expenses;
  List<String> comments;
  List<String> reactions;
  List<String> documents;
  String id;
  String timeHorizon;
  String investingPreference;
  String gender;
  String dob;
  String phone;
  String email;
  String lastName;
  String firstName;
  String importHash;
  String tenant;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  int v;

  Investor({
    required this.status,
    required this.onboardStatuses,
    required this.transfers,
    required this.orders,
    required this.funds,
    required this.beneficiaries,
    required this.expenses,
    required this.comments,
    required this.reactions,
    required this.documents,
    required this.id,
    required this.timeHorizon,
    required this.investingPreference,
    required this.gender,
    required this.dob,
    required this.phone,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.importHash,
    required this.tenant,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Investor.fromJson(Map<String, dynamic> json) {
    return Investor(
      status: List<String>.from(json['status']),
      onboardStatuses: List<String>.from(json['onboardStatuses']),
      transfers: List<String>.from(json['transfers']),
      orders: List<String>.from(json['orders']),
      funds: List<String>.from(json['funds']),
      beneficiaries: List<String>.from(json['beneficiaries']),
      expenses: List<String>.from(json['expenses']),
      comments: List<String>.from(json['comments']),
      reactions: List<String>.from(json['reactions']),
      documents: List<String>.from(json['documents']),
      id: json['_id'],
      timeHorizon: json['timeHorizon'],
      investingPreference: json['investingPreference'],
      gender: json['gender'],
      dob: json['dob'],
      phone: json['phone'],
      email: json['email'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      importHash: json['importHash'],
      tenant: json['tenant'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Investor investor;
  bool gotInvestor = false;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: gotInvestor
          ? Center(
              child: Column(
                children: [
                  Text(investor.firstName),
                  Text(investor.lastName),
                  Text(investor.dob),
                  Text(investor.phone),
                  Text(investor.gender),
                  Text(investor.email),
                ],
              ),
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
        print(parsedResponse);
        investor = Investor.fromJson(parsedResponse);
        setState(() {
          gotInvestor = true;
          investor = investor;
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
