import 'package:flutter/material.dart';

import '../../../core/models/base_model.dart';

// ignore: constant_identifier_names
enum SearcableDdWithPaginatedRequestState { Initial, Busy, Error, Loaded }

class SearcableDdWithPaginatedRequestController {
  final ValueNotifier<SearcableDdWithPaginatedRequestState> state =
      ValueNotifier<SearcableDdWithPaginatedRequestState>(SearcableDdWithPaginatedRequestState.Initial);

  ScrollController scrollController = ScrollController();
  GlobalKey key = GlobalKey();
  FocusNode searchFocusNode = FocusNode();

  final ValueNotifier<BaseModel?> selectedItem = ValueNotifier<BaseModel?>(null);

  final ValueNotifier<List<BaseModel>?> itemList = ValueNotifier<List<BaseModel>?>(null);

  late Function(int page, String? key)? getRequestFunc;

  bool _hasMoreData = true;
  int _page = 1;
  String searchText = '';

  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        if (searchText.isNotEmpty) {
          getRequest(page: _page, key: searchText);
        } else {
          getRequest(page: _page);
        }
      }
    });
  }

  void dispose() {
    searchFocusNode.dispose();
    scrollController.dispose();
  }

  Future<void> getRequest({required int page, String? key, bool isNewSearch = false}) async {
    if (getRequestFunc != null) {
      if (isNewSearch) {
        _page = 1;
        itemList.value = null;
        _hasMoreData = true;
      }
      if (!_hasMoreData) return;
      try {
        state.value = SearcableDdWithPaginatedRequestState.Busy;
        final _response = await getRequestFunc!(page, key);
        if (_response != null) {
          //Bu kısım sizin apinizin döndürdüğü pagination modeline göre değiştirilmesi lazım
          itemList.value ??= [];
          itemList.value = itemList.value! + _response.data;
          if (_response.data != null &&
              _response.pagination?.items?.count != null &&
              _response.data.length < _response.pagination?.items?.count) {
            _hasMoreData = false;
          } else {
            _page = _page + 1;
          }
          state.value = SearcableDdWithPaginatedRequestState.Loaded;
        }

        debugPrint('has more data: $_hasMoreData');
      } catch (exception, stackTrace) {
        state.value = SearcableDdWithPaginatedRequestState.Error;
        throw Exception(exception);
        //await Sentry.captureException(exception, stackTrace: stackTrace);
      }
    }
  }
}
