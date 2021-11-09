import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:great_places_app/providers/great_place.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlaces.items[index].image,
                                ),
                              ),
                              title: Text(greatPlaces.items[index].title),
                              onTap: () {},
                            ),
                          ),
                    child: const Center(
                      child: Text("Got no places yet, start adding some!"),
                    ),
                  ),
      ),
    );
  }
}
