import 'package:pindias_app/presentation/common_widget/dropdown/model/dropdown_model.dart';
import 'package:pindias_app/shared/utils/config.dart';
import 'package:flutter/material.dart';

import 'dropdown_multi_select.dart';

class DropDownDepth extends StatefulWidget {
  final double? width;
  final double? height;
  final void Function(List<List<String>> selectedItems)? onTapItem;

  DropDownDepth({this.height, this.width, this.onTapItem,});

  @override
  DropDownDepthState createState() => DropDownDepthState();
}

class DropDownDepthState extends State<DropDownDepth> {
  List<List<String>> selected = [];
  final List<String> items = TypeOfAdvanced.typeOfAdvanced.keys.toList();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < items.length; i++) {
      selected.add([]);
    }
  }

  List<DropDownModel<String>> _createDirection() {
    final List<String> directions = Direction.direction.keys.toList();
    List<DropDownModel<String>> list = [];
    for (int i = 0; i < directions.length; i++) {

    }
    return list;
  }
  List<DropdownMenuItem<String>> _buildChild() {
    List<DropdownMenuItem<String>> list = [];

    for (int i = 0; i < items.length; i++) {
      String element = items[i];
      list.add(
        DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element),
              SizedBox(
                width: widget.width ?? 120,
                height: widget.height ?? 40,
                child: DropDownWithMultiSelect<String>(
                  // items: i == 2 ? Direction.direction.keys.toList() : NumOfRoom.numOfRoom.keys.toList(),
                  initialItems: selected[i],
                  onTapItem: (List<String> currentSelected) {
                    print(currentSelected);
                    setState(() {
                      selected[i] = currentSelected;
                      if (widget.onTapItem != null) {
                        widget.onTapItem!.call(selected);
                      }
                    });
                  },
                  hint: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text('Tất cả'),
                  ),
                ),
              ),
            ],
          ),
          value: 'element',
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: _buildChild(),
      onChanged: (value) {},
      hint: Align(
        alignment: AlignmentDirectional.center,
        child: Text('Nâng cao'),
      ),
    );
  }
}
