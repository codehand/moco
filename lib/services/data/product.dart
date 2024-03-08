import 'package:moco/models/product.dart';
import 'package:moco/utils/images.dart';

Map<int, ProductModel> mockProducts = {
  0: ProductModel(
    id: "1", 
    code: "1",
    name: "Nước Tinh Khiết Vihawa bình 20L",
    image: Images.vihawa,
    categoryId: "1",
    categoryName: "Nước khoáng",
    maxOrderQuantity: 10,
    minOrderQuantity: 1,
    price: 54000,
    salePrice: 54000,
    currency: "VND",
    rating: 5,
    estDeliverTime: "30m",
  ),
  1: ProductModel(
    id: "1", 
    code: "1",
    name: "Nước Tinh Khiết Vihawa bình 20L",
    image: Images.vihawa,
    categoryId: "1",
    categoryName: "Nước khoáng",
    maxOrderQuantity: 10,
    minOrderQuantity: 1,
    price: 58000,
    salePrice: 54000,
    currency: "VND",
    rating: 4.9,
    estDeliverTime: "15m",
  ),
  2: ProductModel(
    id: "1", 
    code: "1",
    name: "Nước Tinh Khiết Vihawa bình 20L",
    image: Images.vihawa,
    categoryId: "1",
    categoryName: "Nước khoáng",
    maxOrderQuantity: 10,
    minOrderQuantity: 1,
    price: 54000,
    currency: "VND",
    rating: 4,
    estDeliverTime: "20m"
  ),
  3: ProductModel(
    id: "3", 
    code: "3",
    name: "Bình gas Petrolimex 12kg",
    image: Images.gas,
    categoryId: "2",
    categoryName: "Gas",
    maxOrderQuantity: 1,
    minOrderQuantity: 1,
    price: 505000,
    currency: "VND",
    rating: 5,
    estDeliverTime: "50m",
    historyOrder: 1
  ),
  4: ProductModel(
    id: "4", 
    code: "4",
    name: "Bình gas PetroVietNam 12kg",
    image: Images.gasGrey,
    categoryId: "2",
    categoryName: "Gas",
    maxOrderQuantity: 1,
    minOrderQuantity: 1,
    price: 435000,
    salePrice: 405000,
    currency: "VND",
    rating: 5,
    estDeliverTime: "50m",
    historyOrder: 1000
  ),
};