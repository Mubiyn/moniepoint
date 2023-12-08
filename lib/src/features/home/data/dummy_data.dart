import 'package:moniepoint_test/src/features/home/data/model.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';

final dummyUser = User(image: avatarPng, address: 'Wetheimer Illinois ');
final dummyTrackingItem = TrackingItem(
    shipmentNumber: 'NE232727SSJK88881',
    senderAddress: 'Atlanta, 5245',
    time: '2 days- 3 days',
    receiverAddress: 'Chicago, 6342',
    status: 'Waiting to Collect');
final List<AvailableVehiclesModel> vehicles = [
  AvailableVehiclesModel(
      name: 'Ocean freight', range: 'International', image: boatPng),
  AvailableVehiclesModel(
      name: 'Cargo freight', range: 'International', image: lorryPng),
  AvailableVehiclesModel(
      name: 'Air freight', range: 'International', image: boatPng)
];

final List<SearchItem> searchItems = [
  SearchItem(
      shipmentNumber: 'NEJ12388911SW',
      senderAddress: 'Paris',
      receiverAddress: 'Morocco',
      name: 'Macbook Pro M2'),
  SearchItem(
      shipmentNumber: 'SQUEJ12388911SW',
      senderAddress: 'Korea',
      receiverAddress: 'Nigeria',
      name: 'Summer Linen Jacket'),
  SearchItem(
      shipmentNumber: 'TSEJ12388911SW',
      senderAddress: 'London',
      receiverAddress: 'Egypt',
      name: 'Slim Fit Jeans'),
  SearchItem(
      shipmentNumber: 'PEJ12388911SW',
      senderAddress: 'China',
      receiverAddress: 'Ghana',
      name: 'Office Setup Desk'),
  SearchItem(
      shipmentNumber: 'JDJ12388911SW',
      senderAddress: 'Niger',
      receiverAddress: 'France',
      name: 'Uranium')
];
