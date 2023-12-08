class AvailableVehiclesModel {
  final String name;
  final String range;
  final String image;

  AvailableVehiclesModel({
    required this.name,
    required this.range,
    required this.image,
  });
}

class TrackingItem {
  final String shipmentNumber;
  final String senderAddress;
  final String time;
  final String receiverAddress;
  final String status;

  TrackingItem({
    required this.shipmentNumber,
    required this.senderAddress,
    required this.time,
    required this.receiverAddress,
    required this.status,
  });
}

class SearchItem {
  final String shipmentNumber;
  final String senderAddress;
  final String receiverAddress;
  final String name;

  SearchItem({
    required this.shipmentNumber,
    required this.senderAddress,
    required this.receiverAddress,
    required this.name,
  });
}

class User {
  final String image;
  final String address;

  User({
    required this.image,
    required this.address,
  });
}
