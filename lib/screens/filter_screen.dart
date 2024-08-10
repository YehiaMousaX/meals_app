import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegeterian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filters, bool> currentFilters;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegeterian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFree = widget.currentFilters[Filters.lactoseFree]!;
    _vegeterian = widget.currentFilters[Filters.vegeterian]!;
    _vegan = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        // drawer: MainDrawer(
        //   onSelectedScreen: (identifier) {
        //     Navigator.of(context).pop();
        //     if (identifier == "meals") {
        //       Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
        //     }
        //   },
        // ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filters.glutenFree: _glutenFree,
              Filters.lactoseFree: _lactoseFree,
              Filters.vegeterian: _vegeterian,
              Filters.vegan: _vegan,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFree = isChecked;
                  });
                },
                title: Text("Gluten-Free",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "only include gluten-free meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.all(16),
              ),
              SwitchListTile(
                value: _lactoseFree,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFree = isChecked;
                  });
                },
                title: Text("Lactose-Free",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "only include Lactose-free meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.all(16),
              ),
              SwitchListTile(
                value: _vegeterian,
                onChanged: (isChecked) {
                  setState(() {
                    _vegeterian = isChecked;
                  });
                },
                title: Text("Vegeterian",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "only include vegeterian meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.all(16),
              ),
              SwitchListTile(
                value: _vegan,
                onChanged: (isChecked) {
                  setState(() {
                    _vegan = isChecked;
                  });
                },
                title: Text("Vegan",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "only include vegan meals",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.all(16),
              ),
            ],
          ),
        ));
  }
}
