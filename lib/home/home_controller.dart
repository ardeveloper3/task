import 'package:flutter/material.dart';
import 'package:task/data/dummy_profile.dart';
import '../models/profile_model.dart';

class HomeController {
  final selectedMainTab = ValueNotifier<int>(0);
  final selectedCountry = ValueNotifier<String>('All');

  /// 🔹 country tab state
  final ValueNotifier<bool> showMore = ValueNotifier<bool>(false);

  /// 🔹 country lists
  final List<String> mainCountries = ['All', 'Afghanistan', 'India'];
  final List<String> allCountries = [
    'All',
    'Afghanistan',
    'India',
    'Pakistan',
    'Nepal',
    'USA',
  ];

  /// 🔹 top tabs
  final List<String> mainTabs = ['Explore', 'New', 'Pk', 'Follow'];

  /// 🔹 profile filtering
  List<ProfileModel> get filteredProfiles {
    if (selectedCountry.value == 'All') return profiles;
    return profiles
        .where((e) => e.country == selectedCountry.value)
        .toList();
  }
}

