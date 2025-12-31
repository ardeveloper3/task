import '../models/profile_model.dart';

final List<ProfileModel> profiles = [
  ProfileModel(
    name: 'Luca Rossi',
    country: 'India',
    image: 'https://picsum.photos/300/500?1',
    views: 268,
    isPk: true,
  ),
  ProfileModel(
    name: 'Emma Stone',
    country: 'Afghanistan',
    image: 'https://picsum.photos/300/500?2',
    views: 312,
    isPk: false,
  ),
  ProfileModel(
    name: 'Sophia Lee',
    country: 'Pakistan',
    image: 'https://picsum.photos/300/500?3',
    views: 198,
    isPk: true,
  ),
];
