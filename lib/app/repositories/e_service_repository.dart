/*
 * File name: e_service_repository.dart
 * Last modified: 2022.02.04 at 16:43:20
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:get/get.dart';

import '../models/e_service_model.dart';
import '../models/favorite_model.dart';
import '../models/option_group_model.dart';
import '../models/review_model.dart';
import '../providers/laravel_provider.dart';

class EServiceRepository {
  late LaravelApiClient _laravelApiClient;

  EServiceRepository() {
    this._laravelApiClient = Get.find<LaravelApiClient>();
  }

  Future<List<EService>> getAllWithPagination(String categoryId, {int page = 1}) {
    return _laravelApiClient.getAllEServicesWithPagination(categoryId, page);
  }

  Future<List<EService>> search(String? keywords, List<String> categories, {int page = 1}) {
    return _laravelApiClient.searchEServices(keywords, categories, page);
  }

  Future<List<Favorite>> getFavorites() {
    return _laravelApiClient.getFavoritesEServices();
  }

  Future<Favorite> addFavorite(Favorite favorite) {
    return _laravelApiClient.addFavoriteEService(favorite);
  }

  Future<bool> removeFavorite(Favorite favorite) {
    return _laravelApiClient.removeFavoriteEService(favorite);
  }

  Future<List<EService>> getFeatured(String categoryId, {int page = 1}) {
    return _laravelApiClient.getFeaturedEServices(categoryId, page);
  }

  Future<List<EService>> getPopular(String categoryId, {int page = 1}) {
    return _laravelApiClient.getPopularEServices(categoryId, page);
  }

  Future<List<EService>> getMostRated(String categoryId, {int page = 1}) {
    return _laravelApiClient.getMostRatedEServices(categoryId, page);
  }

  Future<List<EService>> getAvailable(String categoryId, {int page = 1}) {
    return _laravelApiClient.getAvailableEServices(categoryId, page);
  }

  Future<EService> get(String id) {
    return _laravelApiClient.getEService(id);
  }

  Future<List<Review>> getReviews(String eServiceId) {
    return _laravelApiClient.getEServiceReviews(eServiceId);
  }

  Future<List<OptionGroup>> getOptionGroups(String eServiceId) {
    return _laravelApiClient.getEServiceOptionGroups(eServiceId);
  }
}
