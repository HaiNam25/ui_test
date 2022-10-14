import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pindias_app/presentation/view/real_estate_detail/bloc/real_estate_detail_cubit.dart';

class MapRealEstate extends StatelessWidget {
  const MapRealEstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RealEstateDetailCubit>(
            create: (context) => RealEstateDetailCubit()),
        BlocProvider<CheckBoxCubit>(create: (context) => CheckBoxCubit())
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vị trí bất động sản',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          BlocBuilder<CheckBoxCubit, CheckBoxState>(builder: (context, state) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 50,
                mainAxisSpacing: 16,
              ),
              itemCount: state.checkBoxes.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  activeColor: const Color(0xff853590),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: state.checkBoxes[index]['isChecked'],
                  title: Text(
                    state.checkBoxes[index]['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.black),
                  ),
                  isThreeLine: false,
                  onChanged: (newValue) => context.read<CheckBoxCubit>().toggleNotification(index, newValue),
                );
              },
            );
          }),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            height: 424,
            child: GoogleMap(
              initialCameraPosition: (const CameraPosition(
                target: (LatLng(
                  20.9759788,
                  105.7658897,
                )),
                zoom: 15,
              )),
              markers: <Marker>{
                const Marker(
                  markerId: MarkerId('marker_1'),
                  position: LatLng(
                    20.9759788,
                    105.7658897,
                  ),
                )
              },
            ),
          ),
        ],
      ),
    );
  }
}
