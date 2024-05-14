import "dart:async";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:location/location.dart";
// import "package:permission_handler/permission_handler.dart";
import "package:shared_preferences/shared_preferences.dart";

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng _center = const LatLng(21.252022, 81.638663);

  final Location _locationController = Location();
  final List<MapEntry> _markers = [
    const MapEntry("Chhattisgarh Institute of Medical Sciences, Bilaspur",
        LatLng(22.088282814519903, 82.15201604628822)),
    const MapEntry(
        "Rajmata Srimati Devendra Kumari Singhdev Govt. Medical College, Surguja",
        LatLng(23.112758026446837, 83.16647980951366)),
    const MapEntry("Government Medical College, Rajnandagaon",
        LatLng(21.08665750120329, 81.03034100085932)),
    const MapEntry(
        "Late Shri Baliram Kashyap Memorial NDMC Medical College, Jagdalpur",
        LatLng(19.050849141507733, 81.94813828118068)),
    const MapEntry(
        "Late Shri Lakhi Ram Agrawal Memorial Gov Medical College, Raigarh",
        LatLng(21.873972949174238, 83.42687968124267)),
    const MapEntry("Pt Jawaharlal Nehru Memorial Medical College, Raipur",
        LatLng(21.25229166693658, 81.63944985424281)),
    const MapEntry("Government Medical College, Mahasamund",
        LatLng(21.119643909791275, 82.07501783519638)),
    const MapEntry("Government Medical College, Korba",
        LatLng(22.35812869099021, 82.77049319578526)),
    const MapEntry("Government Medical College, Kanker",
        LatLng(20.33905740825453, 81.4705406942293)),
    const MapEntry("Chandulal Chandrakar Memorial, GMC, Durg",
        LatLng(21.25089986923391, 81.33683869472104)),
    const MapEntry(
        "AIIMS Raipur", LatLng(21.257091165841274, 81.57950826773569)),
    const MapEntry("Balod District Hospital",
        LatLng(20.71960413007976, 81.19266269655935)),
    const MapEntry("Balodabazar District Hospital",
        LatLng(21.66341427209835, 82.1494383542522)),
    const MapEntry("Balrampur District Hospital",
        LatLng(23.61717043917525, 83.618893485037)),
    // const MapEntry("Bastar District Hospital", LatLng(0, 0)),
    const MapEntry("Bemetara District Hospital",
        LatLng(21.702413364972262, 81.5333258891808)),
    // const MapEntry("Bijapur District Hospital", LatLng(0, 0)),
    const MapEntry("Bilaspur District Hospital",
        LatLng(22.07472541380092, 82.15864314705622)),
    const MapEntry("Dantewada District Hospital",
        LatLng(18.893286350801237, 81.35057643884892)),
    const MapEntry("Dhamtari District Hospital",
        LatLng(20.708080892777474, 81.53956120711909)),
    const MapEntry("Durg District Hospital",
        LatLng(21.187838381055492, 81.27975878095621)),
    const MapEntry("Gariyaband District Hospital",
        LatLng(20.636639301357448, 82.05714942445975)),
    const MapEntry("Janjgir-Champa District Hospital",
        LatLng(22.003269845585965, 82.60721481590276)),
    const MapEntry("Jashpur District Hospital",
        LatLng(22.88245803167378, 84.13732152729574)),
    const MapEntry("Kanker District Hospital",
        LatLng(20.264985064304103, 81.49511218120634)),
    const MapEntry("Kabirdham District Hospital",
        LatLng(22.008619741824624, 81.21797314843907)),
    const MapEntry("Kondagaon District Hospital",
        LatLng(19.56581977433031, 81.67428630050532)),
    const MapEntry("Korba District Hospital",
        LatLng(22.36477008147939, 82.74384035611898)),
    const MapEntry("Korea District Hospital",
        LatLng(23.28012301798281, 82.56454806972997)),
    const MapEntry("Mahasamund District Hospital",
        LatLng(21.12010147625765, 82.0738091119113)),
    const MapEntry("Mungeli District Hospital",
        LatLng(22.06637527304625, 81.68391786427853)),
    const MapEntry("Narayanpur District Hospital",
        LatLng(19.7238045244074, 81.23374001810586)),
    const MapEntry("Raigarh District Hospital",
        LatLng(21.891696650248146, 83.39603589399383)),
    const MapEntry("Raipur District Hospital",
        LatLng(21.26378154208504, 81.65684787049267)),
    const MapEntry("Rajnandgaon District Hospital",
        LatLng(21.086410043323433, 81.0303291620176)),
    const MapEntry(
        "Sukma District Hospital", LatLng(18.388782059657213, 81.681394540689)),
    const MapEntry("Surajpur District Hospital",
        LatLng(23.210435177994498, 82.88021975273308)),
    const MapEntry("Surguja District Hospital",
        LatLng(23.109824746491746, 83.19479592915161)),
  ];

  String? _selectedMarker;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.future.then((GoogleMapController controller) {
      controller.dispose();
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> doSomething() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setDouble("latitude", _center.latitude);
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(21.252022, 81.638663),
    zoom: 14.4746,
  );

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  Future<void> gotoLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newLatLngZoom(location, _initialCameraPosition.zoom));
  }

  Future<void> getLocationUpdates() async {
    bool _seviceEnabled;
    PermissionStatus _permissionGranted;

    _seviceEnabled = await _locationController.serviceEnabled();
    if (!_seviceEnabled) {
      _seviceEnabled = await _locationController.requestService();
      if (!_seviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData event) {
      if (event.latitude != null && event.longitude != null) {
        setState(() {
          _center = LatLng(event.latitude!, event.longitude!);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        title: const Text("Test Centers"),
      ),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationEnabled: true,
          layoutDirection: TextDirection.rtl,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          mapToolbarEnabled: true,
          trafficEnabled: true,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: true,
          markers: {
            const Marker(
              markerId: MarkerId("m1"),
              position: LatLng(22.088282814519903, 82.15201604628822),
              infoWindow: InfoWindow(
                title: "Chhattisgarh Institute of Medical Sciences",
                snippet: "Bilaspur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m2"),
              position: LatLng(23.112758026446837,
                  83.16647980951366), // Placeholder for Rajmata Srimati Devendra Kumari Singhdev Govt. Medical College, Surguja
              infoWindow: InfoWindow(
                title:
                    "Rajmata Srimati Devendra Kumari Singhdev Government Medical College",
                snippet: "Surguja, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m3"),
              position: LatLng(21.08665750120329,
                  81.03034100085932), // Placeholder for Government Medical College, Rajnandagaon
              infoWindow: InfoWindow(
                title: "Government Medical College",
                snippet: "Rajnandagaon, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m4"),
              position: LatLng(19.050849141507733,
                  81.94813828118068), // Placeholder for Late Shri Baliram Kashyap Memorial NDMC Medical College, Jagdalpur
              infoWindow: InfoWindow(
                title:
                    "Late Shri Baliram Kashyap Memorial NDMC Medical College",
                snippet: "Jagdalpur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m5"),
              position: LatLng(21.873972949174238,
                  83.42687968124267), // Placeholder for Late Shri Lakhi Ram Agrawal Memorial Gov Medical College, Raigarh
              infoWindow: InfoWindow(
                title:
                    "Late Shri Lakhi Ram Agrawal Memorial Gov Medical College",
                snippet: "Raigarh, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m6"),
              position: LatLng(21.25229166693658,
                  81.63944985424281), // Placeholder for Pt Jawaharlal Nehru Memorial Medical College, Raipur
              infoWindow: InfoWindow(
                title: "Pt Jawaharlal Nehru Memorial Medical College",
                snippet: "Raipur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m7"),
              position: LatLng(21.119643909791275,
                  82.07501783519638), // Placeholder for GMC Mahasamund
              infoWindow: InfoWindow(
                title: "Government Medical College",
                snippet: "Mahasamund, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m8"),
              position: LatLng(22.35812869099021,
                  82.77049319578526), // Placeholder for GMC, Korba
              infoWindow: InfoWindow(
                title: "Government Medical College",
                snippet: "Korba, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m9"),
              position: LatLng(20.33905740825453,
                  81.4705406942293), // Placeholder for GMC, Kanker
              infoWindow: InfoWindow(
                title: "Government Medical College",
                snippet: "Kanker, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m10"),
              position: LatLng(21.25089986923391,
                  81.33683869472104), // Placeholder for Chandulal Chandrakar Memorial, GMC, Durg
              infoWindow: InfoWindow(
                title:
                    "Chandulal Chandrakar Memorial, Government Medical College",
                snippet: "Durg, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("m11"),
              position: LatLng(21.257091165841274,
                  81.57950826773569), // Placeholder for AIIMS Raipur
              infoWindow: InfoWindow(
                title: "AIIMS Raipur",
                snippet:
                    "Chhattisgarh", // The number of seats is not provided in your data.
              ),
            ),
            const Marker(
              markerId: MarkerId("dh1"),
              position: LatLng(20.71960413007976,
                  81.19266269655935), // Placeholder for Balod District Hospital
              infoWindow: InfoWindow(
                title: "Balod District Hospital",
                snippet: "Balod, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh2"),
              position: LatLng(21.66341427209835,
                  82.1494383542522), // Placeholder for Balodabazar District Hospital
              infoWindow: InfoWindow(
                title: "Balodabazar District Hospital",
                snippet: "Balodabazar, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh3"),
              position: LatLng(23.61717043917525,
                  83.618893485037), // Placeholder for Balrampur District Hospital
              infoWindow: InfoWindow(
                title: "Balrampur District Hospital",
                snippet: "Balrampur, Chhattisgarh",
              ),
            ),
            // const Marker(
            //   markerId: MarkerId("dh4"),
            //   position: LatLng(0, 0), // Placeholder for Bastar District Hospital
            //   infoWindow: InfoWindow(
            //     title: "Bastar District Hospital",
            //     snippet: "Bastar",
            //   ),
            // ),
            const Marker(
              markerId: MarkerId("dh5"),
              position: LatLng(21.702413364972262,
                  81.5333258891808), // Placeholder for Bemetara District Hospital
              infoWindow: InfoWindow(
                title: "Bemetara District Hospital",
                snippet: "Bemetara, Chhattisgarh",
              ),
            ),
            // const Marker(
            //   markerId: MarkerId("dh6"),
            //   position:
            //       LatLng(0, 0), // Placeholder for Bilaspur District Hospital
            //   infoWindow: InfoWindow(
            //     title: "Bijapur District Hospital",
            //     snippet: "Bijapur",
            //   ),
            // ),
            const Marker(
              markerId: MarkerId("dh7"),
              position: LatLng(22.07472541380092,
                  82.15864314705622), // Placeholder for Bilaspur District Hospital
              infoWindow: InfoWindow(
                title: "Bilaspur District Hospital",
                snippet: "Bilaspur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh8"),
              position: LatLng(18.893286350801237,
                  81.35057643884892), // Placeholder for Dantewada District Hospital
              infoWindow: InfoWindow(
                title: "Dantewada District Hospital",
                snippet: "Dantewada, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh9"),
              position: LatLng(20.708080892777474,
                  81.53956120711909), // Placeholder for Dhamtari District Hospital
              infoWindow: InfoWindow(
                title: "Dhamtari District Hospital",
                snippet: "Dhamtari, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh10"),
              position: LatLng(21.187838381055492,
                  81.27975878095621), // Placeholder for Durg District Hospital
              infoWindow: InfoWindow(
                title: "Durg District Hospital",
                snippet: "Durg, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh11"),
              position: LatLng(20.636639301357448,
                  82.05714942445975), // Placeholder for Gariyaband District Hospital
              infoWindow: InfoWindow(
                title: "Gariyaband District Hospital",
                snippet: "Gariyaband, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh12"),
              position: LatLng(22.003269845585965,
                  82.60721481590276), // Placeholder for Janjgir-Champa District Hospital
              infoWindow: InfoWindow(
                title: "Janjgir-Champa District Hospital",
                snippet: "Janjgir-Champa, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh13"),
              position: LatLng(22.88245803167378,
                  84.13732152729574), // Placeholder for Jashpur District Hospital
              infoWindow: InfoWindow(
                title: "Jashpur District Hospital",
                snippet: "Jashpur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh14"),
              position: LatLng(20.264985064304103,
                  81.49511218120634), // Placeholder for Kanker District Hospital
              infoWindow: InfoWindow(
                title: "Kanker District Hospital",
                snippet: "Kanker, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh15"),
              position: LatLng(22.008619741824624,
                  81.21797314843907), // Placeholder for Kabirdham District Hospital
              infoWindow: InfoWindow(
                title: "Kabirdham District Hospital",
                snippet: "Kabirdham, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh16"),
              position: LatLng(19.56581977433031,
                  81.67428630050532), // Placeholder for Kondagaon District Hospital
              infoWindow: InfoWindow(
                title: "Kondagaon District Hospital",
                snippet: "Kondagaon, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh17"),
              position: LatLng(22.36477008147939,
                  82.74384035611898), // Placeholder for Korba District Hospital
              infoWindow: InfoWindow(
                title: "Korba District Hospital",
                snippet: "Korba, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh18"),
              position: LatLng(23.28012301798281,
                  82.56454806972997), // Placeholder for Korea District Hospital
              infoWindow: InfoWindow(
                title: "Korea District Hospital",
                snippet: "Korea, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh19"),
              position: LatLng(21.12010147625765,
                  82.0738091119113), // Placeholder for Mungeli District Hospital
              infoWindow: InfoWindow(
                title: "Mahasamund District Hospital",
                snippet: "Mahasamund, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh20"),
              position: LatLng(22.06637527304625,
                  81.68391786427853), // Placeholder for Mungeli District Hospital
              infoWindow: InfoWindow(
                title: "Mungeli District Hospital",
                snippet: "Mungeli, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh21"),
              position: LatLng(19.7238045244074,
                  81.23374001810586), // Placeholder for Narayanpur District Hospital
              infoWindow: InfoWindow(
                title: "Narayanpur District Hospital",
                snippet: "Narayanpur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh22"),
              position: LatLng(21.891696650248146,
                  83.39603589399383), // Placeholder for Raigarh District Hospital
              infoWindow: InfoWindow(
                title: "Raigarh District Hospital",
                snippet: "Raigarh, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh23"),
              position: LatLng(21.26378154208504,
                  81.65684787049267), // Placeholder for Raipur District Hospital
              infoWindow: InfoWindow(
                title: "Raipur District Hospital",
                snippet: "Raipur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh24"),
              position: LatLng(21.086410043323433,
                  81.0303291620176), // Placeholder for Rajnandgaon District Hospital
              infoWindow: InfoWindow(
                title: "Rajnandgaon District Hospital",
                snippet: "Rajnandgaon, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh25"),
              position: LatLng(18.388782059657213,
                  81.681394540689), // Placeholder for Sukma District Hospital
              infoWindow: InfoWindow(
                title: "Sukma District Hospital",
                snippet: "Sukma, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh26"),
              position: LatLng(23.210435177994498,
                  82.88021975273308), // Placeholder for Surajpur District Hospital
              infoWindow: InfoWindow(
                title: "Surajpur District Hospital",
                snippet: "Surajpur, Chhattisgarh",
              ),
            ),
            const Marker(
              markerId: MarkerId("dh27"),
              position: LatLng(23.109824746491746,
                  83.19479592915161), // Placeholder for Surguja District Hospital
              infoWindow: InfoWindow(
                title: "Surguja District Hospital",
                snippet: "Surguja, Chhattisgarh",
              ),
            ),
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Card(
            color: Colors.white,
            // padding: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select a test center:'),
                  const SizedBox(height: 15),
                  DropdownButton(
                    value: _selectedMarker,
                    items: _markers
                        .map((MapEntry entry) => DropdownMenuItem<String>(
                              value: entry.key,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 100),
                                child: SizedBox(
                                  width: 220,
                                  child: Text(entry.key,
                                      style: const TextStyle(fontSize: 13),
                                      overflow: TextOverflow.visible),
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMarker = newValue;
                        gotoLocation(_markers
                            .firstWhere(
                                (MapEntry entry) => entry.key == newValue)
                            .value);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
