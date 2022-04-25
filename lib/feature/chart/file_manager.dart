import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/feature/chart/base_chart_model.dart';

import 'example/chart_model.dart';

class FileManager {
  static List<BaseChartModel> getDatas(String path, VoidCallback onDone, void Function(dynamic error) onError) {
    List<BaseChartModel> dataList = [];

    /// Parametre olarak verilen path ile dosyayı belirtir
    final file = File(path);

    /// index tutmaya yarayacak değişken
    int _startNum = 0;

    Stream<List> inputStream = file.openRead();

    inputStream.transform(utf8.decoder).transform(const LineSplitter()).listen(
      (String line) {
        /// CSV dosyasından gelen dataya uygun ayırma işlemi
        List row = line.split(';');

        /// Ayrılan datanın 1. indexindeki sayı verisi alınır
        String data = row[1];

        /// int'e çevrilmesi denenir
        int? moneyCSV = int.tryParse(data);

        /// Çevrilebilirliği kontrol edilir
        if (moneyCSV != null) {
          /// Listeye bu veri ile index kullanılarak eklenir
          BaseChartModel model = ChartModel(day: _startNum, money: moneyCSV);

          dataList.add(model);
        }
        _startNum++;
      },

      /// Dosya okuma işlemi bittiği zaman çalışacak kodlar
      onDone: onDone,

      /// Dosya okuma işlemi esnasında hata çıkarsa çalışacak kodlar
      onError: onError,
    );

    return dataList;
  }
}
