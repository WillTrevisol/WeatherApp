import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/location_store.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);

  final LocationStore controller = GetIt.I.get<LocationStore>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(
      builder: (_) {
        if (controller.cityList.isNotEmpty) {
          return SizedBox(
            width: size.width * 0.8,
            child: CupertinoTextFormFieldRow(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              initialValue: controller.filter,
              placeholder: 'Pesquise sua cidade',
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  CupertinoIcons.search,
                  color: CupertinoColors.white,
                ),
              ),
              onChanged: (value) {
                controller.setFilter(value);
              },
            ),
          );
        }
        return Container();
      }
    );
  }
}