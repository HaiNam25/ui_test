import 'package:pindias_app/domain/entities/address.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/domain/entities/real_estate_type.dart';
import 'package:pindias_app/presentation/common_widget/dropdown/component/dropdown_in_dropdown.dart';
import 'package:pindias_app/presentation/common_widget/dropdown/component/dropdown_multi_select.dart';
import 'package:pindias_app/presentation/common_widget/dropdown/component/dropdown_with_radio.dart';
import 'package:pindias_app/presentation/common_widget/loading_data.dart';
import 'package:pindias_app/domain/entities/districts.dart';
import 'package:pindias_app/presentation/view/fl_map/fl_map.dart';
import 'package:pindias_app/presentation/view/fl_map/marker_controller.dart';
import 'package:pindias_app/presentation/view/fl_map/polygon_controller.dart';
import 'package:pindias_app/presentation/view/gg_map/components/message_border.dart';
import 'package:pindias_app/shared/utils/config.dart';
import 'package:pindias_app/shared/utils/format_text_to_number.dart';
import 'package:pindias_app/shared/utils/map_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../gg_map/dto/search_map_dto.dart';
import 'filter_control.dart';

class FilterPage extends StatefulWidget {
  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  List<String> realEstateOptions = [];
  List<String> provincesOptions = [];
  List<String> districtsOptions = [];
  
  String provinceId = '';
  final MiddleFilterControl filterControlInterface = FilterControl();

  final SearchMapDto searchMapDto = SearchMapDto();
  // final MiddlePolygonControl polygonControl = PolygonControl();
  // final MiddleMarkerControl markerControl = MarkerControl();
  final FormatTextToNumber formatTextToNumber = FormatTextToNumber();

  final MiddleMarkerController middleMarkerController = MarkerController();
  final MiddlePolygonController middlePolygonController = PolygonController();

  @override
  void initState() {
    super.initState();
    filterControlInterface.getRealEstateType(realEstateType: RealEstateType(status: RealEstateStatus.active, type: TypeEstate.realEstate,));
    filterControlInterface.getProvinces();
  }

  void _addMarker(Category<RealEstate> category) {
    middleMarkerController.clear();
    for (RealEstate element in category.content ?? []) {
      if (element.isHasId && element.isCanCreateLatLng) {
        final marker = Marker(
          point: LatLng(
            element.getLatitude,
            element.getLongitude,
          ),
          builder: (context) {
            return Container(
              decoration: ShapeDecoration(
                shape: MessageBorder(),
                color: const Color.fromRGBO(115, 21, 100, 0.8),
              ),
              child: Center(
                child: Text(
                  formatTextToNumber.compactMoney(money: element.price),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
          width: 70,
        );
        middleMarkerController.addNewMarker(
          marker: marker,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 285,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Purpose.listPurpose.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          searchMapDto.changeValue(
                              purpose: Purpose.listPurpose[index]);
                        },
                        child: Text(Purpose.listPurpose[index]),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                height: 40,
                child: StreamBuilder<Category<RealEstateType>?>(
                    stream: filterControlInterface.realEstateType,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        realEstateOptions.clear();
                        if (realEstateOptions.isEmpty && filterControlInterface.isHasRealEstateType) {
                          snapshot.data?.content?.forEach((element) {
                            realEstateOptions.add(element.name ?? '');
                          });
                        }
                        realEstateOptions.removeAt(0);

                        return DropDownWithMultiSelect<String>(
                          // items: realEstateOptions,
                          onTapItem: (List<String> selectedItem) {
                            searchMapDto.changeValue(categories: selectedItem);
                          },
                        );
                      }
                      return LoadingData(
                        insteadWidget: DropDownWithRadio<String>(
                          items: [],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 150,
                height: 40,
                child: StreamBuilder<Address?>(
                  stream: filterControlInterface.provinces,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      provincesOptions.clear();
                      if (provincesOptions.isEmpty) {
                        snapshot.data!.provinces?.forEach((element) {
                          provincesOptions.add(element.name ?? '');
                        });
                      }
                      return DropDownWithRadio<String>(
                        items: provincesOptions,
                        onTapItem: (String? selectedItem) {
                          if (selectedItem != null) {
                            setState(() {
                              provinceId = snapshot.data!
                                  .findIdByName(name: selectedItem);
                              filterControlInterface.getDistrictsByProvince(provinceId: provinceId);
                            });
                            searchMapDto.changeValue(province: selectedItem);
                          }
                        },
                      );
                    }
                    return LoadingData(
                      insteadWidget: DropDownWithRadio<String>(
                        items: [],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 180,
                height: 40,
                child: DropDownWithMultiSelect<String>(
                  // items: BottomLimitedArea.rangeArea.keys.toList(),
                  onTapItem: (selectedItems) {
                    List<String> newValue = MapUtil.getValuesByKeys(
                        map: BottomLimitedArea.rangeArea, keys: selectedItems);
                    searchMapDto.changeValue(areaRange: newValue);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 180,
                height: 40,
                child: DropDownWithMultiSelect<String>(
                  // items: BottomLimitedPrice.rangePrice.keys.toList(),
                  onTapItem: (selectedItems) {
                    List<String> newValue = MapUtil.getValuesByKeys(
                        map: BottomLimitedPrice.rangePrice, keys: selectedItems);
                    searchMapDto.changeValue(priceRange: newValue);
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 180,
                height: 40,
                child: StreamBuilder<Districts?>(
                    stream: filterControlInterface.districts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        districtsOptions.clear();
                        if (districtsOptions.isEmpty) {
                          snapshot.data?.districts?.forEach((element) {
                            districtsOptions.add(element.name ?? '');
                          });
                        }

                        return DropDownWithMultiSelect<String>(
                          // items: districtsOptions,
                          onTapItem: (List<String> selectedItem) {
                            searchMapDto.changeValue(districts: selectedItem);
                          },
                        );
                      }
                      return LoadingData(
                        insteadWidget: DropDownWithMultiSelect<String>(
                          items: [],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            width: 244,
            height: 40,
            child: DropDownDepth(
              // width: 80,
              height: 40,
              onTapItem: (selectedItems) {
                List<String> listBathrooms = MapUtil.getValuesByKeys(
                    map: NumOfRoom.numOfRoom, keys: selectedItems[0]);
                List<String> listBedrooms = MapUtil.getValuesByKeys(
                    map: NumOfRoom.numOfRoom, keys: selectedItems[1]);
                List<String> listDirections = MapUtil.getValuesByKeys(
                    map: Direction.direction, keys: selectedItems[2]);

                searchMapDto.changeValue(bathrooms: listBathrooms);
                searchMapDto.changeValue(bedrooms: listBedrooms);
                searchMapDto.changeValue(directions: listDirections);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("get data"),
              onPressed: () {
                print(
                    'https://dev.pindias.com/api/redissearch/search?${searchMapDto.searchUri}');
                filterControlInterface.getData(searchMapDto: searchMapDto);
                if (super.mounted) {
                  setState(() {

                  });
                }
              },
            ),
          ),
          Expanded(
           child: Stack(
             children: [
               FlMap(
                 polygonController: middlePolygonController,
                 markerController: middleMarkerController,
               ),
               StreamBuilder<Category<RealEstate>?>(
                 stream: filterControlInterface.dataCategory,
                 builder: (context, AsyncSnapshot<Category<RealEstate>?> snapshot) {
                   print('snapshot.data: ${snapshot.data}');
                   if (snapshot.hasData) {
                     _addMarker(snapshot.data!);
                   }
                   return SizedBox.shrink();
                 },
               ),
             ],
           ),
         ),
         // Expanded(
         //   child: GoogleMapEx(polygonControl: polygonControl, markerControl: markerControl,),
         // )
        ],
      ),
    );
  }
}
