import 'dart:collection';

import '../models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = []  ;
  CategoryModel categoryModel = CategoryModel();

  //1.
  categoryModel.CategoryName = "Business";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1541535881962-3bb380b08458?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YnVzaW5lc3MlMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Entertainment";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "General";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmV3c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Health";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8SGVhbHRofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Science";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8U2NpZW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Sports";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8U3BvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "Technology";
  categoryModel.ImageURL = "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  return category;
}