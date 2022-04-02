import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/dao/cart_dao.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../global_handlers.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    cartDao = CartDao();
  }

  CartDao cartDao;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is FetchCart) {
      yield* _mapFetchCartToState(event);
    }
  }

  Stream<CartState> _mapFetchCartToState(FetchCart event) async* {
    yield CartLoading();
    try {
      customLog("Cart stream entered...");
      var response = await cartDao.getCart();
      customLog(response.toString());
      var jsonDecoded = jsonDecode(response.body);
      customLog(jsonDecoded.toString());
      if (jsonDecoded['accessCode'] != null) {
        yield CartSuccess();
      } else if (jsonDecoded != null) {
        ScaffoldMessenger.of(GlobalBlocClass.homeContext).showSnackBar(
          SnackBar(
            content: Text(
              jsonDecoded["message"],
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontFamily: 'Visby',
                  fontSize: SizeConfig.blockWidth * 3.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
        yield CartFailure(message: jsonDecoded["message"]);
      }
    } catch (err) {
      customLog('error is ${err.toString()}');
      ScaffoldMessenger.of(GlobalBlocClass.homeContext).showSnackBar(
        SnackBar(
          content: Text(
            "Something went wrong",
            style: TextStyle(
                letterSpacing: 0.5,
                fontFamily: 'Visby',
                fontSize: SizeConfig.blockWidth * 3.5,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
      yield CartFailure(message: "Something went wrong");
    }
  }
}
