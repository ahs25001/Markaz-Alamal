import 'package:flutter/material.dart';
import 'package:markaz_elamal/core/utils/app_images.dart';
import 'package:markaz_elamal/features/home/domain/entities/category_entity.dart';
import 'package:markaz_elamal/features/home/presentation/pages/category_tab.dart';
import 'package:markaz_elamal/features/home/presentation/pages/home_tab.dart';
import 'package:markaz_elamal/features/home/presentation/pages/profile_tab.dart';

import '../../features/home/presentation/pages/book_tab.dart';
import 'app_strings.dart';

String baseUrl = "192.168.1.149";

///Widgets
List<Widget> tabs = [
  HomeTab(),
  CategoryTab(),
  BookTab(),
  ProfileTab(),
];
///Models
List<CategoryEntity>categories = [
CategoryEntity(image: speechImage, name: speech),
CategoryEntity(image: autismImage, name: autism),
CategoryEntity(image: learningDeficultiesImage, name: learningDifficulties),
CategoryEntity(image: intelligenceTestImage, name: intelligenceTest),
CategoryEntity(image: behaviorModificationImage, name: behaviorModification),
CategoryEntity(image: skillsDevelopmentImage, name: skillsDevelopment),
];