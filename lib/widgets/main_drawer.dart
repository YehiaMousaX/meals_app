import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedScreen});
  final void Function(String identfier) onSelectedScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            Icon(
              Icons.fastfood,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 20),
            Text("Cooking Up!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          title: Text(
            "Meals",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          onTap: () {
            onSelectedScreen("meals");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          title: Text(
            "Fillters",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          onTap: () {
            onSelectedScreen("fillters");
          },
        ),
      ],
    ));
  }
}
