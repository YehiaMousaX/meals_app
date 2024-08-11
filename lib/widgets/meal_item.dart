import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });
  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  IconData getAffordabilityIcon(String affordability) {
    switch (affordability) {
      case 'Affordable':
        return Icons.money_off_outlined;
      case 'Pricey':
        return Icons.money_rounded;
      case 'Luxurious':
        return Icons.attach_money;
      default:
        return Icons.attach_money;
    }
  }

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () => {
          onSelectedMeal(meal),
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(width: 12),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          const SizedBox(width: 12),
                          MealItemTrait(
                              icon: getAffordabilityIcon(affordabilityText),
                              label: affordabilityText)
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
