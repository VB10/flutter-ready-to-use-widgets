import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/init/network/network_service.dart';
import '../searchable_dropdown_with_paginated_request.dart';
import 'model.dart';

class SearchAbleDropdownWithPagintedRequestExample extends StatelessWidget {
  const SearchAbleDropdownWithPagintedRequestExample({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAbleDropdownWithPaginatedRequest(
        hintText: 'Anime Ara',
        getRequest: (page, key) {
          return getCustomerList(page: page, key: key);
        },
        nameField: 'title',
        label: 'Anime seç',
        leadingIcon: const Icon(Icons.palette_outlined),
        style: TextStyle(color: ColorConstants.black.withOpacity(0.8)),
        onItemSelected: (selectedItem) {
          if (selectedItem is Data) debugPrint(selectedItem.title);
        });
  }

  Future<AnimeList?> getCustomerList({required int page, String? key}) async {
    try {
      String url = "https://api.jikan.moe/v4/anime?page=$page";
      if (key != null && key.isNotEmpty) url += "&q=$key";
      var response = await NetworkService.instance.networkManager
          .send<AnimeList, AnimeList>(
        url,
        parseModel: AnimeList(),
        method: RequestType.GET,
      );
      if (response.error != null) throw Exception(response.error);
      return response.data;
    } catch (exception) {
      //await Sentry.captureException(exception, stackTrace: stackTrace);
    }
    return null;
  }
}
