import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_country/api/apiservices.dart';
import 'package:flutter_country/screens/detail_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/country.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices(Dio());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Countries List'),
        ),
        body: FutureBuilder<List<Country>>(
          future: apiServices.getCountries(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Country>? country = snapshot.data;
              return ListView.builder(
                  itemCount: country!.length,
                  itemBuilder: (context, position) {
                    return item(country[position], context);
                  });
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget item(Country country, context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(apiServices, country.name),
            ));
      },
      leading: CachedNetworkImage(
        imageUrl: 'https://countryflagsapi.com/png/${country.alpha2Code}',
        width: 50,
        height: 50,
        placeholder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
      ),
      title: Text(country.name),
      subtitle: Text(country.region),
    );
  }
}
