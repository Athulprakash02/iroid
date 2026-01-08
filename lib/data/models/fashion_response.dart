class FashionResponse {
  String? status;
  FashionData? data;

  FashionResponse({this.status, this.data});

  FashionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new FashionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FashionData {
  TailorNearYou? tailorNearYou;
  DesignsByArya? designsByArya;
  MostPopular? mostPopular;
  AllTimeFav? allTimeFav;
  Lehenga? lehenga;
  MostPopular? topSaled;
  Lehenga? breezyCotton;
  MostPopular? topSaled2;
  Lehenga? friendlyFloral;

  FashionData(
      {this.tailorNearYou,
      this.designsByArya,
      this.mostPopular,
      this.allTimeFav,
      this.lehenga,
      this.topSaled,
      this.breezyCotton,
      this.topSaled2,
      this.friendlyFloral});

  FashionData.fromJson(Map<String, dynamic> json) {
    tailorNearYou = json['tailor_near_you'] != null
        ? new TailorNearYou.fromJson(json['tailor_near_you'])
        : null;
    designsByArya = json['designs_by_arya'] != null
        ? new DesignsByArya.fromJson(json['designs_by_arya'])
        : null;
    mostPopular = json['most_popular'] != null
        ? new MostPopular.fromJson(json['most_popular'])
        : null;
    allTimeFav = json['all_time_fav'] != null
        ? new AllTimeFav.fromJson(json['all_time_fav'])
        : null;
    lehenga =
        json['lehenga'] != null ? new Lehenga.fromJson(json['lehenga']) : null;
    topSaled = json['top_saled'] != null
        ? new MostPopular.fromJson(json['top_saled'])
        : null;
    breezyCotton = json['breezy_cotton'] != null
        ? new Lehenga.fromJson(json['breezy_cotton'])
        : null;
    topSaled2 = json['top_saled_2'] != null
        ? new MostPopular.fromJson(json['top_saled_2'])
        : null;
    friendlyFloral = json['friendly_floral'] != null
        ? new Lehenga.fromJson(json['friendly_floral'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tailorNearYou != null) {
      data['tailor_near_you'] = this.tailorNearYou!.toJson();
    }
    if (this.designsByArya != null) {
      data['designs_by_arya'] = this.designsByArya!.toJson();
    }
    if (this.mostPopular != null) {
      data['most_popular'] = this.mostPopular!.toJson();
    }
    if (this.allTimeFav != null) {
      data['all_time_fav'] = this.allTimeFav!.toJson();
    }
    if (this.lehenga != null) {
      data['lehenga'] = this.lehenga!.toJson();
    }
    if (this.topSaled != null) {
      data['top_saled'] = this.topSaled!.toJson();
    }
    if (this.breezyCotton != null) {
      data['breezy_cotton'] = this.breezyCotton!.toJson();
    }
    if (this.topSaled2 != null) {
      data['top_saled_2'] = this.topSaled2!.toJson();
    }
    if (this.friendlyFloral != null) {
      data['friendly_floral'] = this.friendlyFloral!.toJson();
    }
    return data;
  }
}

class TailorNearYou {
  String? sectionTitle;
  Profile? profile;

  TailorNearYou({this.sectionTitle, this.profile});

  TailorNearYou.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['section_title'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_title'] = this.sectionTitle;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? name;
  String? designation;
  String? image;
  bool? hasFollowButton;
  bool? hasLikeButton;
  bool? hasShareButton;
  bool? viewMore;

  Profile(
      {this.name,
      this.designation,
      this.image,
      this.hasFollowButton,
      this.hasLikeButton,
      this.hasShareButton,
      this.viewMore});

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    image = json['image'];
    hasFollowButton = json['has_follow_button'];
    hasLikeButton = json['has_like_button'];
    hasShareButton = json['has_share_button'];
    viewMore = json['view_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['image'] = this.image;
    data['has_follow_button'] = this.hasFollowButton;
    data['has_like_button'] = this.hasLikeButton;
    data['has_share_button'] = this.hasShareButton;
    data['view_more'] = this.viewMore;
    return data;
  }
}

class DesignsByArya {
  String? sectionTitle;
  String? subtitle;
  List<Categories>? categories;

  DesignsByArya({this.sectionTitle, this.subtitle, this.categories});

  DesignsByArya.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['section_title'];
    subtitle = json['subtitle'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_title'] = this.sectionTitle;
    data['subtitle'] = this.subtitle;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class MostPopular {
  String? sectionTitle;
  List<Products>? products;

  MostPopular({this.sectionTitle, this.products});

  MostPopular.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['section_title'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_title'] = this.sectionTitle;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  int? originalPrice;
  String? currency;
  double? rating;
  String? reviewsCount;
  bool? hasWishlist;

  Products(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.originalPrice,
      this.currency,
      this.rating,
      this.reviewsCount,
      this.hasWishlist});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    originalPrice = json['original_price'];
    currency = json['currency'];
    rating = json['rating'];
    reviewsCount = json['reviews_count'];
    hasWishlist = json['has_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['original_price'] = this.originalPrice;
    data['currency'] = this.currency;
    data['rating'] = this.rating;
    data['reviews_count'] = this.reviewsCount;
    data['has_wishlist'] = this.hasWishlist;
    return data;
  }
}

class AllTimeFav {
  String? sectionTitle;
  List<Banners>? banners;

  AllTimeFav({this.sectionTitle, this.banners});

  AllTimeFav.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['section_title'];
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_title'] = this.sectionTitle;
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Banners({this.id, this.title, this.subtitle, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['image'] = this.image;
    return data;
  }
}

class Lehenga {
  String? sectionTitle;
  Banner? banner;

  Lehenga({this.sectionTitle, this.banner});

  Lehenga.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['section_title'];
    banner =
        json['banner'] != null ? new Banner.fromJson(json['banner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_title'] = this.sectionTitle;
    if (this.banner != null) {
      data['banner'] = this.banner!.toJson();
    }
    return data;
  }
}

class Banner {
  int? id;
  String? title;
  String? subtitle;
  String? brand;
  String? image;

  Banner({this.id, this.title, this.subtitle, this.brand, this.image});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    brand = json['brand'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['brand'] = this.brand;
    data['image'] = this.image;
    return data;
  }
}
