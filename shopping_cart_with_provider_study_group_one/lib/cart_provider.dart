
import 'package:cart_example/cart_model.dart';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return{..._items};

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity
    });
    return total;
  }

  }

  void addItem (String productId, Double price, String title){
    if (_items.containsKey(productId)){
      _items.update(
        productId,
        (existingCartItem)=> cartItem(
          id: existingCartItem.id,
          price: existingCartItem.price,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
        )
      );
     } else {
    _items.putIfAbsent(
      productId,
      () => cartItem (
        id: DateTime.now().toString(),
        price: price,
        title: title,
        quantity: 1,
      ),
    );
    }

    notifyListeners();
  }

  void removeItem (String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem (String productId) {
    if (! _items.containsKey(productId)){
      return;
    }
    
    if (_items[productId]!.quantity > 1){
      _items.update(
        productId,
        (existingCartItem) => cartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity - 1,
          price: existingCartItem.price,
        )
      );

    }else{
      _items.remove(productId);
    }
    notifyListeners();
  }
}
