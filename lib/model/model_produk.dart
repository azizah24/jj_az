class ModelProduk{
  String status, message;
  List<DataProduk> data;

  ModelProduk(this.status, this.message, this.data);

  ModelProduk.fromJson(Map<String, dynamic> json) :
       status = json['status'],
        message = json['message'],
        data = List<DataProduk>.from(json['data'].map((x) => DataProduk.fromJson(x)));

}

class DataProduk{
  String id, name, price, img;

  DataProduk({required this.id, required this.name, required this.price, required this.img});

  DataProduk.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      name = json['name'],
      price = json['price'],
      img = json['img'];
}