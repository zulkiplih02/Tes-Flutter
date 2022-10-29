import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_food/bloc/bloc.dart';
import 'package:italian_food/component/appbar.dart';
import 'package:italian_food/component/card_food.dart';
import 'package:italian_food/component/colors.dart';
import 'package:italian_food/component/progress_indicator.dart';
import 'package:italian_food/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initialization();
  }

  void _initialization() {
    context.read<BlocFood>().add(const ListEventFood());
  }

  _snackBar(value) {
    var snackBar = SnackBar(content: Text(value));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.greyBackground,
      appBar: const MyAppBar(
        title: "ITALIAN FOOD",
      ),
      body: BlocBuilder<BlocFood, DataState>(
        builder: (context, state) {
          if (state is LoadingData) {
            return const Center(child: CircularProgress());
          } else if (state is DataListState) {
            return GridView.count(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: (2 / 2.5),
              children: state.data!
                  .map((item) => CardFood(
                        thumbnail: item.strMealThumb!,
                        title: item.strMeal!,
                        press: () {
                          context.read<BlocFood>().add(DetailEventFood(
                                id: item.idMeal ?? "",
                                onEmptyDetail: () => _snackBar("Empty data"),
                                onSuccess: ({required detailData}) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              foodModel: detailData,
                                            )),
                                  );
                                },
                              ));
                        },
                      ))
                  .toList(),
            );
          } else {
            return const Center(child: Text('Failed load data'));
          }
        },
      ),
    );
  }
}
