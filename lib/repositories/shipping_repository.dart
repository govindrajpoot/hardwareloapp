
import 'package:http/http.dart' as http;

import '../app_config.dart';
import '../data_model/check_response_model.dart';
import '../data_model/delivery_info_response.dart';
import '../helpers/response_check.dart';
import '../helpers/shared_value_helper.dart';

class ShippingRepository{
  Future<dynamic> getDeliveryInfo() async {
    Uri url =
    Uri.parse("${AppConfig.BASE_URL}/delivery-info");
    print(url.toString());
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${access_token.$}",
        "App-Language": app_language.$,
      },
    );

    bool checkResult = ResponseCheck.apply(response.body);

    if(!checkResult)
      return responseCheckModelFromJson(response.body);


    return deliveryInfoResponseFromJson(response.body);
  }

}