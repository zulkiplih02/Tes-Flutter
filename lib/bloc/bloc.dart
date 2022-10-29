import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_food/model/model.dart';
import 'package:italian_food/provider/provider.dart';

part 'event.dart';
part 'state.dart';

class BlocFood extends Bloc<EventFood, DataState> {
  BlocFood() : super(InitialData()) {
    on<ListEventFood>(_listData);
    on<DetailEventFood>(_detailData);
  }

  void _listData(ListEventFood event, Emitter<DataState> emitter) async {
    emitter(LoadingData());
    try {
      List<FoodModel> data = await ApiFoodProvider.getFood();
      emitter(DataListState(data: data));
    } catch (e) {
      emitter(FailureData());
    }
  }

  void _detailData(DetailEventFood event, Emitter<DataState> emitter) async {
    try {
      FoodModel? data = await ApiFoodProvider.getFoodId(event.id);
      if (data.idMeal == null) {
        event.onEmptyDetail();
      }
      event.onSuccess(detailData: data);
    } catch (e, st) {
      debugPrint(e.toString());
      debugPrint(st.toString());
      event.onEmptyDetail();
    }
  }
}
