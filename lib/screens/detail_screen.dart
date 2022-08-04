import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country/api/apiservices.dart';

import '../models/detail.dart';

class DetailPage extends StatelessWidget {
  final ApiServices apiServices;
  final String countryName;
  DetailPage(this.apiServices, this.countryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: FutureBuilder<List<Detail>>(
            future: apiServices.getDetail(countryName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Detail detail = snapshot.data![0];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          'Country Name : ${detail.name}',
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                      Text(
                        'Region : ${detail.region}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Sub-Region : ${detail.subregion}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Population : ${detail.population}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Language Used: ${detail.demonym}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            'https://countryflagsapi.com/png/${detail.alpha2Code}',
                        width: 300,
                        height: 300,
                        placeholder: (_, __) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
