class ModelImage{
  String status, message;
  List<DataImage> data;

  ModelImage(this.status, this.message, this.data);

  ModelImage.fromJson(Map<String, dynamic> json) :
        status = json['status'],
        message = json['message'],
        data = List<DataImage>.from(json['data'].map((x) => DataImage.fromJson(x)));
}

class DataImage{
  String title, url, img;

  DataImage({required this.title, required this.url, required this.img});

  DataImage.fromJson(Map<String, dynamic> json) :
    title = json['title'],
    url = json['url'],
    img = json['img'];

}