class Welcome {
  bool success;
  String message;
  Data data;

  Welcome({
    required this.success,
    required this.message,
    required this.data,
  });
}

class Data {
  List<Offer> offers;
  Meta meta;

  Data({
    required this.offers,
    required this.meta,
  });
}

class Meta {
  int page;
  int total;

  Meta({
    required this.page,
    required this.total,
  });
}

class Offer {
  String id;
  Provider provider;
  Service service;
  String status;

  Offer({
    required this.id,
    required this.provider,
    required this.service,
    required this.status,
  });
}

class Provider {
  String id;
  String name;

  Provider({
    required this.id,
    required this.name,
  });
}

class Service {
  String id;
  String image;
  String title;
  int price;
  String category;

  Service({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.category,
  });
}
