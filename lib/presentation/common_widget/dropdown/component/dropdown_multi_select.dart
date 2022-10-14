import 'package:pindias_app/presentation/common_widget/dropdown/model/dropdown_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownWithMultiSelect<T> extends StatefulWidget {
  final List<DropDownModel<T>>? items;
  final Widget? hint;
  final void Function(List<T> currentSelectedItems)? onTapItem;
  final VoidCallback? onPressed;
  final List<T>? initialItems;

  DropDownWithMultiSelect({
    this.items = const [],
    this.onTapItem,
    this.onPressed,
    this.hint,
    this.initialItems,
  });

  @override
  DropDownWithMultiSelectState<T> createState() =>
      DropDownWithMultiSelectState<T>();
}

class DropDownWithMultiSelectState<T>
    extends State<DropDownWithMultiSelect<T>> {
  late final List<T> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.initialItems ?? [];
  }

  List<DropdownMenuItem<DropDownModel<T>>> _buildDropDownMenuItem() {
    List<DropdownMenuItem<DropDownModel<T>>> list = widget.items!.map((item) {
      return DropdownMenuItem<DropDownModel<T>>(
        value: item,
        enabled: false,
        child: StatefulBuilder(
          builder: (context, menuSetState) {
            final _isSelected = selectedItems.contains(item.data);
            return InkWell(
              onTap: () {
                if (_isSelected) {
                  selectedItems.remove(item.data);
                }
                else {
                  if (item.hasData) {
                    selectedItems.add(item.data!);
                  }
                }
                //This rebuilds the StatefulWidget to update the button's text
                setState(() {});
                //This rebuilds the dropdownMenu Widget to update the check mark
                menuSetState(() {});
                if (widget.onTapItem != null) {
                  widget.onTapItem!.call(selectedItems);
                }
              },
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(left: 10),
                // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _isSelected
                        ? const Icon(Icons.check_box_outlined)
                        : const Icon(Icons.check_box_outline_blank),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }).toList();

    list.add(
      DropdownMenuItem<DropDownModel<T>>(
        child: Center(
          child: ElevatedButton(
            child: Text('Confirm'),
            onPressed: () {
              if (widget.onPressed != null) {
                widget.onPressed!();
              }
            },
          ),
        ),
        value: null,
      ),
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<DropDownModel<T>>(
            isExpanded: true,
            hint: widget.hint ??
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'Select Items',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
            items: _buildDropDownMenuItem(),
            // value: selectedItems.isEmpty ? null : selectedItems.last,
            onChanged: (value) {},
            buttonHeight: 40,
            buttonWidth: 180,
            dropdownMaxHeight: 300,
            itemHeight: 40,
            itemPadding: EdgeInsets.zero,
            selectedItemBuilder: (context) {
              return widget.items!.map(
                (item) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      selectedItems.join(', '),
                      style: const TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
          ),
        ),
      ),
    );
  }
}
