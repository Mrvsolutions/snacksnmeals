import 'dart:convert';

class UserProfile {
 String cust_id = "";
 String restaurant_id = "";
 String cust_name = "";
 String cust_city = "";
 String cust_mobileno = "";
 String cust_email = "";
 String cust_pswd = "";
 String cust_profile_pic = "";
 String signup_datetime = "";
 String frgt_pswd_rqst = "";

  UserProfile(String cust_id, String restaurant_id ,String cust_name, String cust_city,String cust_mobileno,String cust_email, String cust_pswd, String cust_profile_pic, String signup_datetime,String frgt_pswd_rqst) {
    this.cust_id = cust_id;
    this.restaurant_id = restaurant_id;
    this.cust_name = cust_name;
    this.cust_city = cust_city;
    this.cust_mobileno = cust_mobileno;
    this.cust_email = cust_email;
    this.cust_pswd = cust_pswd;
    this.cust_profile_pic = cust_profile_pic;
    this.signup_datetime = signup_datetime;
    this.frgt_pswd_rqst = frgt_pswd_rqst;
  }

  UserProfile.fromJson(Map json)
      : cust_id = json['cust_id'],
        restaurant_id = json['restaurant_id'],
        cust_name = json['cust_name'],
        cust_city = json['cust_city'],
        cust_mobileno = json['cust_mobileno'],
        cust_email = json['cust_email'],
        cust_pswd = json['cust_pswd'],
        cust_profile_pic = json['cust_profile_pic'],
        signup_datetime = json['signup_datetime'],
        frgt_pswd_rqst = json['frgt_pswd_rqst'];


  Map toJson() {
    return {'cust_id': cust_id, 'restaurant_id':restaurant_id,'cust_name': cust_name, 'cust_city': cust_city,'cust_mobileno': cust_mobileno,'cust_email':cust_email,'cust_pswd':cust_pswd,'cust_profile_pic':cust_profile_pic,'signup_datetime':signup_datetime,'frgt_pswd_rqst':frgt_pswd_rqst};
  }
}