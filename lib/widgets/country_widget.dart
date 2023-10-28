import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'country.dart';


class CountryListWidget extends StatefulWidget {
  const CountryListWidget({Key? key}) : super(key: key);

  @override
  State<CountryListWidget> createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  final searchTextController = TextEditingController();
  List<Country> all = [];
  List<Country> filter = [];

  @override
  void initState() {
    super.initState();
    all.addAll(countries);
    filter.addAll(countries);
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      height: context.height * 0.75,
      width: context.height * 0.5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Search Country",),
              IconButton(onPressed: Get.back, icon: const Icon(Icons.clear)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: searchTextController,
            onChanged: (v) {
              //Write search logic here
              searchMethod(v);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                borderSide: const BorderSide(color: Colors.black54, width: 0.5),
              ),
              hintText: "Eg. India, In, +91",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filter.length,
              itemBuilder: (_, i) {
                final model = filter[i];
                return ListTile(
                  onTap: () {
                    Get.back(result: model);
                  },
                  leading: Image.asset(model.imagePath),
                  title: Text(model.name),
                  trailing: Text(model.dialCode),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchMethod(v) async {
    print(v);
    await Future.delayed(const Duration(milliseconds: 15));

    setState(() {
      filter = all.where((c) => c.name.contains(v)).toList();
      filter=all.where((c) => c.dialCode.contains(v)).toList();
    });
  }
}
