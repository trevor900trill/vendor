import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:line_icons/line_icons.dart';

import './restapi.dart';

class VendorMap extends StatefulWidget {
  VendorMap({@required this.id});
  final id;
  @override
  State createState() => _VendorMapState();
}

class _VendorMapState extends State<VendorMap> {
  bool entertapmode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _newmarkermodetoggle() {
    entertapmode = !entertapmode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text("Vendor",
              style: TextStyle(fontFamily: 'NanumGothic'),
              textAlign: TextAlign.center),
          backgroundColor: Colors.white.withOpacity(0.5),
          actions: [
            Icon(LineIcons.bell),
            Icon(Icons.store),
            Icon(Icons.person),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: FutureBuilder(
          future: RestApi()
              .fetchmarkers("/maps/fetchfollowingmarkers/" + widget.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                color: Colors.black54,
                child: FlutterMap(
                  options: MapOptions(
                    center: latLng.LatLng(51.5, -0.09),
                    zoom: 13.0,
                    onTap: null,
                  ),
                  children: <Widget>[
                    TileLayerWidget(
                      options: TileLayerOptions(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/trevor900trill/ckka53ph92zi117lfulbxxnp1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidHJldm9yOTAwdHJpbGwiLCJhIjoiY2sxY2Fnc3dmMDFneTNkbHBudzF6YjdsYyJ9.9YpcHcIAWA7iKeTsT4UDyQ",
                        additionalOptions: {
                          "accessToken":
                              "pk.eyJ1IjoidHJldm9yOTAwdHJpbGwiLCJhIjoiY2sxY2Fnc3dmMDFneTNkbHBudzF6YjdsYyJ9.9YpcHcIAWA7iKeTsT4UDyQ",
                          "id": "mapbox.mapbox-streets-v8",
                        },
                      ),
                    ),
                    MarkerLayerWidget(
                      options: MarkerLayerOptions(markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: latLng.LatLng(51.5, -0.09),
                          builder: (ctx) => Container(
                            child: FlutterLogo(),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
