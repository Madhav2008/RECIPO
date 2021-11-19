class Resturants {
  String name;
  String isOpen;
  String imageUrl;
  String address;
  String rate;
  String type;
  String distance;
  String phone;
  String openTime;

  Resturants({
    this.name,
    this.imageUrl,
    this.isOpen,
    this.address,
    this.type,
    this.rate,
    this.distance,
    this.phone,
    this.openTime,
  });
}

final List<Resturants> resturants = [
  Resturants(
    imageUrl: 'assets/Logo2Recipo.png',
    name: 'Happy Bones',
    isOpen: 'OPEN',
    rate: "4.5",
    type: 'Italian',
    distance: '12',
    address: '394 Broome St, New York, NY 10013, USA',
    phone: '+2 212-673-3754',
  ),
  Resturants(
    imageUrl: 'assets/Logo2Recipo.png',
    name: 'Uncle Boons',
    isOpen: 'OPEN',
    rate: "3.5",
    type: 'Mexician',
    distance: '1.2',
    address: '7 Spring St, New York, NY 10012, USA',
    phone: '+2 212-673-3754',
  ),
  Resturants(
    imageUrl: 'assets/Logo2Recipo.png',
    name: 'Happy Bones',
    isOpen: 'CLOSE',
    rate: "4.5",
    type: 'Italian',
    distance: '12',
    address: '394 Broome St, New York, NY 10013, USA',
    phone: '+2 212-673-3754',
  ),
];
