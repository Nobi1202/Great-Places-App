import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: _previewImageUrl != null
              ? const Text(
                  "No Location Chosen",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.location_on),
            label: const Text('Current Location'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.map),
          label: const Text('Select on Map'),
          style: ElevatedButton.styleFrom(
            onPrimary: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
