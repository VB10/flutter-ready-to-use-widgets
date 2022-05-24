abstract class ICheckBoxItem {
  final int id;
  final String name;
  bool isSelected;

  ICheckBoxItem({required this.id, required this.name, required this.isSelected});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ICheckBoxItem && other.name == name && other.id == id && other.isSelected == isSelected;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isSelected.hashCode;

  @override
  String toString() => "Id: $id , Name: $name , IsSelected: $isSelected";
}
