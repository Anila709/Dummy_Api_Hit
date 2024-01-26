

class ProductListModel {
    List<ProductModel> products;
    int total;
    int skip;
    int limit;

    ProductListModel({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductListModel.fromJson(Map<String, dynamic> json) { 

      List<ProductModel> eachProduct=[];
      for(Map<String,dynamic> eachMap in json["products"]){
        var data=ProductModel.fromJson(eachMap);
        eachProduct.add(data);
      }
      return ProductListModel(
        products: eachProduct,
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );}

    // Map<String, dynamic> toJson() => {
    //     "products": List<dynamic>.from(products.map((x) => x.toJson())),
    //     "total": total,
    //     "skip": skip,
    //     "limit": limit,
    // };
}

class ProductModel {
    int id;
    String title;
    String description;
    int price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    ProductModel({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "title": title,
    //     "description": description,
    //     "price": price,
    //     "discountPercentage": discountPercentage,
    //     "rating": rating,
    //     "stock": stock,
    //     "brand": brand,
    //     "category": category,
    //     "thumbnail": thumbnail,
    //     "images": List<dynamic>.from(images.map((x) => x)),
    // };
}
