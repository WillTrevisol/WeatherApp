import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../entities/user_location.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({required this.userLocation, required this.onLongPress, required this.onTap, Key? key}) : super(key: key);

  final UserLocation userLocation;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${userLocation.city.name}, '
        '${userLocation.uf.initials}',
        style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white),
      ),
      leading: const Icon(
        CupertinoIcons.location_solid,
        color: CupertinoColors.white,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: CupertinoColors.white,
      ),
      onLongPress: onLongPress,
      onTap: onTap,
    );
  }
}