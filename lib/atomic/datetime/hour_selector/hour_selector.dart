import 'package:flutter/material.dart';

import '../../../feature/dropdown/searchable_dropdown_with_paginated_request/searchable_dropdown_with_paginated_request.dart';

extension CustomTimeOfDayExtension on TimeOfDay {
  Duration substract(TimeOfDay timeOfDay) =>
      Duration(hours: hour, minutes: minute) - Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

  TimeOfDay addMinutes(int minutes) {
    if (minutes == 0) return this;
    int mofd = hour * 60 + minute;
    int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
    if (mofd == newMofd) return this;
    int newHour = newMofd ~/ 60;
    int newMinute = newMofd % 60;
    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  String toStringFormat() => (hour < 10 ? '0' : '') + '$hour:' + (minute < 10 ? '0' : '') + '$minute';
}

//TODO bu widgeta disabled hours özelliği de kazandırılabilir. Verilen saatler kırmızı gelir ve seçilemez.

// ignore: must_be_immutable
class HourSelector extends StatefulWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  ///Bu widgetın Hangi zaman aralıklarıyla çizileceğini belirtin
  final int timeInterval;
  final String? label;

  ///Returns selected hour with onSelected method
  final Function(TimeOfDay)? onSelected;

  final List<TimeOfDay>? unSelectedHours;

  ///Multiple'da seçilmeyen saatleri döndürür
  final Function(List<TimeOfDay> unSelectedHours)? onChangedUnSelectedHours;
  bool? isMultiple;
  TextStyle? style;

  ///On selected'da seçilen saati döndürür
  ///Returns selected hour with onSelected method
  HourSelector({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.timeInterval,
    this.label,
    required this.onSelected,
    this.onChangedUnSelectedHours,
    this.unSelectedHours,
    this.style,
  }) : super(key: key) {
    isMultiple = false;
  }

  ///onChangedDisabledHours'da seçilmeyen saatlerin listesini döndürür
  ///On onChangedDisabledHours returns disabled(unselected) hours list
  HourSelector.multiple({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.timeInterval,
    this.label,
    required this.onChangedUnSelectedHours,
    this.onSelected,
    this.unSelectedHours,
    this.style,
  }) : super(key: key) {
    isMultiple = true;
  }

  @override
  State<HourSelector> createState() => _HourSelectorState();
}

class _HourSelectorState extends State<HourSelector> {
  late Duration totalTime;
  int widgetCount = 0;
  int? selectedId;
  late List<TimeOfDay> unSelectedHours;

  @override
  void initState() {
    unSelectedHours = widget.unSelectedHours ?? [];
    totalTime = widget.endTime.substract(widget.startTime);
    widgetCount = (totalTime.inMinutes ~/ widget.timeInterval);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) labelText,
        SizedBox(height: deviceHeight * 0.01),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            runSpacing: deviceHeight * 0.02,
            spacing: deviceHeight * 0.02,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (var i = 0; i < widgetCount; i++)
                SelectableHourWidget(
                  time: widget.startTime.addMinutes(widget.timeInterval * i),
                  selectableHourStatus: widget.isMultiple!
                      ? unSelectedHours.contains(widget.startTime.addMinutes(widget.timeInterval * i))
                          ? SelectableHourStatus.available
                          : SelectableHourStatus.selected
                      : selectedId == i
                          ? SelectableHourStatus.selected
                          : SelectableHourStatus.available,
                  onTap: (time) {
                    if (widget.isMultiple!) {
                      setState(() {
                        if (unSelectedHours.contains(time)) {
                          unSelectedHours.remove(time);
                        } else {
                          unSelectedHours.add(time);
                        }
                      });
                      widget.onChangedUnSelectedHours!(unSelectedHours);
                    } else {
                      setState(() => selectedId = i);
                      widget.onSelected!(widget.startTime.addMinutes(widget.timeInterval * i));
                    }
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  Padding get labelText {
    final deviceHeight = MediaQuery.of(context).size.height;
    final textSize = deviceHeight * 0.018;
    return Padding(
      padding: EdgeInsets.only(left: deviceHeight * 0.015),
      child: Text(
        widget.label!,
        style: widget.style?.copyWith(fontSize: textSize) ?? TextStyle(fontSize: textSize),
      ),
    );
  }
}

enum SelectableHourStatus { available, selected, full }

class SelectableHourWidget extends StatelessWidget {
  final TimeOfDay time;
  final SelectableHourStatus selectableHourStatus;
  final Function(TimeOfDay time) onTap;
  const SelectableHourWidget({Key? key, required this.time, required this.selectableHourStatus, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    //Custom Inkwell dropdown widgetımda var zaten ordan çektim direk
    return CustomInkwell(
      disableTabEfect: true,
      padding: EdgeInsets.zero,
      onTap: () => onTap(time),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.20,
          padding: EdgeInsets.symmetric(horizontal: deviceHeight * 0.015, vertical: deviceHeight * 0.005),
          decoration: BoxDecoration(
            color: selectableHourStatus == SelectableHourStatus.selected ? Colors.green : null,
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.02),
            border: Border.all(color: selectableHourStatus == SelectableHourStatus.selected ? Colors.green : Colors.grey),
          ),
          alignment: Alignment.center,
          child: Text(
            time.format(context), //24 saat formatına göre düzgün ancak 12 saat formatında widgetı düzenlemeniz gerekebilir
            style: TextStyle(color: selectableHourStatus == SelectableHourStatus.selected ? Colors.white : null),
          )),
    );
  }
}
