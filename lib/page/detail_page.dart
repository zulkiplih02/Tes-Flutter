import 'package:flutter/material.dart';
import 'package:italian_food/component/appbar.dart';
import 'package:italian_food/component/colors.dart';

import 'package:italian_food/model/model.dart';

class DetailPage extends StatefulWidget {
  final FoodModel foodModel;

  const DetailPage({super.key, required this.foodModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late FoodModel data;

  @override
  void initState() {
    super.initState();
    data = widget.foodModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        title: "DETAIL FOOD",
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: ContentBody(
              thumbnail: data.strMealThumb!,
              title: data.strMeal!,
              labelIngredient: "Ingredients",
              listIngredient: [
                if (data.strIngredient1 != "" && data.strIngredient1 != " ")
                  Ingredients(
                    label: data.strMeasure1!,
                    value: data.strIngredient1!,
                  ),
                if (data.strIngredient2 != "" && data.strIngredient2 != " ")
                  Ingredients(
                    label: data.strMeasure2!,
                    value: data.strIngredient2!,
                  ),
                if (data.strIngredient3 != "" && data.strIngredient3 != " ")
                  Ingredients(
                    label: data.strMeasure3!,
                    value: data.strIngredient3!,
                  ),
                if (data.strIngredient4 != "" && data.strIngredient4 != " ")
                  Ingredients(
                    label: data.strMeasure4!,
                    value: data.strIngredient4!,
                  ),
                if (data.strIngredient5 != "" && data.strIngredient5 != " ")
                  Ingredients(
                    label: data.strMeasure5!,
                    value: data.strIngredient5!,
                  ),
                if (data.strIngredient6 != "" && data.strIngredient6 != " ")
                  Ingredients(
                    label: data.strMeasure6!,
                    value: data.strIngredient6!,
                  ),
                if (data.strIngredient7 != "" && data.strIngredient7 != " ")
                  Ingredients(
                    label: data.strMeasure7!,
                    value: data.strIngredient7!,
                  ),
                if (data.strIngredient8 != "" && data.strIngredient8 != " ")
                  Ingredients(
                    label: data.strMeasure8!,
                    value: data.strIngredient8!,
                  ),
                if (data.strIngredient9 != "" && data.strIngredient9 != " ")
                  Ingredients(
                    label: data.strMeasure9!,
                    value: data.strIngredient9!,
                  ),
                if (data.strIngredient10 != "" && data.strIngredient10 != " ")
                  Ingredients(
                    label: data.strMeasure10!,
                    value: data.strIngredient10!,
                  ),
                if (data.strIngredient11 != "" && data.strIngredient11 != " ")
                  Ingredients(
                    label: data.strMeasure11!,
                    value: data.strIngredient11!,
                  ),
                if (data.strIngredient12 != "" && data.strIngredient12 != " ")
                  Ingredients(
                    label: data.strMeasure12!,
                    value: data.strIngredient12!,
                  ),
                if (data.strIngredient13 != "" && data.strIngredient13 != " ")
                  Ingredients(
                    label: data.strMeasure13!,
                    value: data.strIngredient13!,
                  ),
                if (data.strIngredient14 != "" && data.strIngredient14 != " ")
                  Ingredients(
                    label: data.strMeasure14!,
                    value: data.strIngredient14!,
                  ),
                if (data.strIngredient15 != "" && data.strIngredient15 != " ")
                  Ingredients(
                    label: data.strMeasure15!,
                    value: data.strIngredient15!,
                  ),
                if (data.strIngredient16 != "" && data.strIngredient16 != " ")
                  Ingredients(
                    label: data.strMeasure16!,
                    value: data.strIngredient16!,
                  ),
                if (data.strIngredient17 != "" && data.strIngredient17 != " ")
                  Ingredients(
                    label: data.strMeasure17!,
                    value: data.strIngredient17!,
                  ),
                if (data.strIngredient18 != "" && data.strIngredient18 != " ")
                  Ingredients(
                    label: data.strMeasure18!,
                    value: data.strIngredient18!,
                  ),
                if (data.strIngredient19 != "" && data.strIngredient19 != " ")
                  Ingredients(
                    label: data.strMeasure19!,
                    value: data.strIngredient19!,
                  ),
                if (data.strIngredient20 != "" && data.strIngredient20 != " ")
                  Ingredients(
                    label: data.strMeasure20!,
                    value: data.strIngredient20!,
                  ),
              ],
              labelInstruction: "How to make ?",
              instruction: data.strInstructions!)),
    );
  }
}

class ContentBody extends StatelessWidget {
  final String title, labelIngredient, labelInstruction, thumbnail, instruction;
  final List<Widget>? listIngredient;
  const ContentBody(
      {super.key,
      required this.title,
      required this.labelIngredient,
      required this.labelInstruction,
      required this.thumbnail,
      required this.instruction,
      this.listIngredient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInImage.assetNetwork(
          placeholder: "assets/images/placeholder.png",
          image: thumbnail,
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            title,
            style: const TextStyle(
                height: 1.5,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        LabelContent(label: labelIngredient),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(children: listIngredient!),
        ),
        LabelContent(label: labelInstruction),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            instruction,
            style: const TextStyle(height: 1.5),
          ),
        )
      ],
    );
  }
}

class LabelContent extends StatelessWidget {
  final String label;
  const LabelContent({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      color: MyColor.greyBackground,
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: MyColor.primary),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  final String label, value;
  const Ingredients({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Text("-"),
        ),
        Expanded(
            child: Text(
          (label != "" && label != " ") ? "$label . $value" : value,
          style: const TextStyle(fontWeight: FontWeight.w600, height: 1.5),
        )),
      ],
    );
  }
}
