import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_jj/model/model_image.dart';
import 'package:test_jj/model/model_produk.dart';

class KoneksiJson {
  Future<ModelImage> getImage() async {
    final data = await rootBundle.loadString('jsonFile/api-slider.json');
    final mapsData = json.decode(data);
    print(mapsData);
    if (mapsData.isNotEmpty) {
      return ModelImage.fromJson(mapsData);
    } else {
      throw Exception('not found');
    }
  }

  Future<ModelProduk> getProduk() async {
    final data =
        await rootBundle.loadString('jsonFile/api-featured-product.json');
    final mapsData = json.decode(data);
    if (mapsData.isNotEmpty) {
      return ModelProduk.fromJson(mapsData);
    } else {
      throw Exception('not found');
    }
  }

  Future<ModelProduk> getProdukHistory() async {
    final data =
        await rootBundle.loadString('jsonFile/api-last-purchased.json');
    final mapsData = json.decode(data);
    if (mapsData.isEmpty) {
      return ModelProduk.fromJson(mapsData);
    } else {
      throw Exception('not found');
    }
  }
}
