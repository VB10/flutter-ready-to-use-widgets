import 'abstract_checkbox_item.dart';

class City extends ICheckBoxItem {
  City({
    required int id,
    required String name,
    bool? isSelected,
  }) : super(id: id, name: name, isSelected: isSelected = false);

  static List<City> cityList = [
    City(id: 1, name: 'Sakarya'),
    City(id: 2, name: 'Ankara'),
    City(id: 3, name: 'Elazığ'),
    City(id: 4, name: 'Erzurum'),
    City(id: 5, name: 'Bursa'),
    City(id: 6, name: 'Edirne'),
    City(id: 7, name: 'Muğla'),
    City(id: 8, name: 'Kars'),
    City(id: 9, name: 'Ardahan'),
    City(id: 10, name: 'Trabzon'),
    City(id: 11, name: 'Antalya'),
    City(id: 12, name: 'Şırnak'),
    City(id: 13, name: 'Muş'),
    City(id: 14, name: 'Erzincan'),
    City(id: 15, name: 'Hakkari'),
    City(id: 16, name: 'Bolu'),
  ];
}
