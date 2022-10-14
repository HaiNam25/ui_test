import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownWithRadio<T> extends StatefulWidget {
  final List<T>? items;
  final void Function(T? selectedItem)? onTapItem;
  final T? initialItem;

  DropDownWithRadio({this.items = const [], this.onTapItem, this.initialItem,});

  @override
  _DropDownWithRadioState<T> createState() => _DropDownWithRadioState<T>();
}

class _DropDownWithRadioState<T> extends State<DropDownWithRadio<T>> {
  List<bool> isSelected = [];
  int previousSelected = 0;
  T? _hintText;
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.items!.length; i++) {
      isSelected.add(false);
    }
    _hintText = widget.initialItem;
    for (int i = 0; i < isSelected.length; i++) {
      if (widget.items![i] == _hintText.toString()) {
        isSelected[i] = true;
      }
    }
  }

  List<DropdownMenuItem<T>> _build() {
    List<DropdownMenuItem<T>> list = [];
    for (int i = 0; i < widget.items!.length; i++) {
      final T item = widget.items![i];
      list.add(
          DropdownMenuItem<T>(
            value: item,
            onTap: () {
              setState(() {
                _hintText = item;
                isSelected[i] = !isSelected[i];
                isSelected[previousSelected] = false;
                previousSelected = i;
                _selectedItem = widget.items![i];
              });

              if (widget.onTapItem != null) {
                widget.onTapItem!.call(_selectedItem);
              }
            },
            child: Row(
              children: [
                Container(
                  width: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected[i] ? Colors.blue : Colors.black,
                        width: 2.0,
                      )
                  ),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10, height: 10,),
                Text(item.toString(), style: TextStyle(fontSize: 12),),
              ],
            ),
          )
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        items: _build(),
        onChanged: (value) {
        },
        itemHeight: 48,
        dropdownMaxHeight: 200,
        value: _hintText,
        dropdownWidth: 160,
        buttonWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
        hint: _hintText != null ? Text(_hintText.toString()) : null,
        selectedItemBuilder: (context) {
          final lenHintText = _hintText.toString().length;

          return widget.items!.map(
                (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: lenHintText >= 10 ? null : EdgeInsets.only(left: 38),
                child: Text(
                    _hintText.toString()
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
}
