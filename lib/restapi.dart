import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:http/io_client.dart';

import './ip.dart';

class RestApi {
  //POST: /useraccounts/signup
  Future<http.Response> signup(String endpoint, Map signupbody) async {
    final response = await http.post(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode(signupbody),
    );
    return response;
  }

  //POST: /useraccounts/login
  Future<http.Response> login(
      String endpoint, String email, String password) async {
    final response = await http.post(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode({'Email': email, 'Password': password}),
    );
    return response;
  }

  //POST: /verification/signup
  Future<http.Response> sendemailtocreateaccount(
      String endpoint, String email) async {
    final response = await http.post(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode({'Email': email}),
    );
    return response;
  }

  //POST: /accountspool/createcustomer
  Future<http.Response> createcustomerrequest(
      String endpoint, Map customerbody) async {
    final response = await http.post(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode(customerbody),
    );
    return response;
  }

  //POST: /accountspool/createsubscription?refid=refid&phonenumber=phonenumber&email=email
  Future<http.Response> createsubscription(
      String endpoint, Map subscriptionbody) async {
    final response = await http.post(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode(subscriptionbody),
    );
    return response;
  }

  //PUT: /accountspool/createcustomercard
  Future<http.Response> createcustomercardrequest(
      String endpoint, Map cardbody) async {
    final response = await http.put(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode(cardbody),
    );
    return response;
  }

  //PUT: /verification/resetpassword
  Future<http.Response> sendemailtochangepasswd(
      String endpoint, String email) async {
    final response = await http.put(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode({'Email': email}),
    );
    return response;
  }

  //PUT: /useraccounts/resetpassword
  Future<http.Response> resetpassword(String endpoint, Map resetpassreq) async {
    final response = await http.put(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode(resetpassreq),
    );
    return response;
  }

  //GET: /verification/verifybymodel?email=params&code=params
  Future<http.Response> verifycode(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /accountspool/searchspecificsubscriptionplan/id
  Future<http.Response> getsubcriptionplanbycountry(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /accountspool/retrievesubscriptionbyrefid?refid=refid&phonenumber=phonenumber&email=email
  Future<http.Response> retrievesubscriptionbyrefid(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /accountspool/getuploadinfo/id
  Future<http.Response> getuploadinfo(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /accountspool/getnotifications/id
  Future<http.Response> getnotifications(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /accountspool/getpresearchdata/id
  Future<http.Response> getpresearchdata(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /accountspool/searchfordata/id
  Future<http.Response> searchfordata(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET: /maps/fetchfollowingmarkers/id
  Future<http.Response> fetchmarkers(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET : api/artists/uploads/id
  Future<http.Response> fetchuploadsbyartistid(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    return response;
  }

  //GET : /uploads/fetchcuratedsavedobj?id=id&type=playlist
  Future fetchcuratedsavedobj(String endpoint) async {
    final response = await http.get(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
      },
    );
    var decoded = json.decode(response.body);
 
    return decoded;
  }

  //GET: /uploads/fetchhomedata/id
  Future<List<Address>> _getlocations() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print(addresses.first.countryName);
    return addresses;
  }

  static int currentTimeInSeconds() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  Future fetchhomedata(String endpoint) async {
    List<Address> locations = await _getlocations();
    final response = await http.get(
      Adress.myip +
          endpoint +
          "?region=" +
          locations.first.countryName +
          "&timestamp=" +
          currentTimeInSeconds().toString(),
      headers: {
        'Accept': 'Application/json',
      },
    );
    var decoded = json.decode(response.body);
    //var account = HomeFetchResponse.fromJson(decoded);

    return decoded;
  }

  //Delete: /verification/deleteresource?email=email
  Future<http.Response> deleteverificationresource(String endpoint) async {
    final response = await http.delete(
      Adress.myip + endpoint,
      headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json; charset=UTF-8',
      },
    );
    return response;
  }
}
