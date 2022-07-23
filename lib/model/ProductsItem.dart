import 'dart:convert';
import 'package:flutter/material.dart';

class ProductsItem {
 String favr_id = "";
 String restaurant_id = "";
 String cust_id = "";
 String product_id = "";
 String psubcat_id = "";
 String p_name = "";
 String p_currency_sign = "";
 String p_price = "";
 String p_description = "";
 String p_pic = "";

 String p_is_available = "";
 String p_have_discount = "";

  UserProfile(String favr_id, String restaurant_id ,String cust_id, String product_id,String psubcat_id,String p_name, String p_currency_sign, String p_price, String p_description,String p_pic,String p_is_available,String p_have_discount) {
    this.favr_id = favr_id;
    this.restaurant_id = restaurant_id;
    this.cust_id = cust_id;
    this.product_id = product_id;
    this.psubcat_id = psubcat_id;
    this.p_name = p_name;
    this.p_currency_sign = p_currency_sign;
    this.p_price = p_price;
    this.p_description = p_description;
    this.p_pic = p_pic;
    this.p_is_available = p_is_available;
    this.p_have_discount = p_have_discount;
  }

 ProductsItem.fromJson(Map json)
      : favr_id = json['favr_id'],
        restaurant_id = json['restaurant_id'],
        cust_id = json['cust_id'],
        product_id = json['product_id'],
        psubcat_id = json['psubcat_id'],
        p_name = json['p_name'],
        p_currency_sign = json['p_currency_sign'],
        p_price = json['p_price'],
        p_description = json['p_description'],
        p_pic = json['p_pic'],
        p_is_available = json['p_is_available'],
        p_have_discount = json['p_have_discount'];


  Map toJson() {
    return {'favr_id': favr_id, 'restaurant_id':restaurant_id,'cust_id': cust_id, 'product_id': product_id,'psubcat_id': psubcat_id,'p_name':p_name,'p_currency_sign':p_currency_sign,'p_price':p_price,'p_description':p_description,'p_pic':p_pic,'p_is_available':p_is_available,'p_have_discount':p_have_discount};
  }
}