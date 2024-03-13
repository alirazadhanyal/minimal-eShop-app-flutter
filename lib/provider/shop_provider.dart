import 'package:e_shop_minimal/models/product_model.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
// Product List
  List<Product> products = [
    Product(
        name: "Wireless In-Ear Headphones",
        desc: """PLAY TIME: 5 hours in earbuds
CHARGING TIME: 2 hours (number of charges in charging case: 4)
WATER RESISTANCE: IPX5 in earbuds, IPX4 in charging case
MICROPHONE & REMOTE: Yes (dual)""",
        price: "49,999",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/m/a/marshall_mode_ii_true_wireless_in-ear_headphones_3-_tejar.jpg"),
    Product(
        name: "Tri-Band Gaming Router",
        desc: """Memory: 1 GB RAM and 512 MB Flash
Button: Wi-Fi On/Off Button, Reset Button, WPS Button, Power On/Off Button, LED on/off Button
External Power Supply: 12V/5A
Antenna: 8 High-Performance External Antennas""",
        price: "99,999",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/t/p/tp-link_ax11000_next-gen_tri-band_gaming_router_-_tejar.jpg"),
    Product(
        name: "RGB Gaming Mouse",
        desc: """61 Grams Extreme Light
CONNECTER: USB 2.0
HoneyComb Shell Strength and Comfort
Glide smoothly with G-Skates feet.""",
        price: "13,899",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/g/l/glorious_model_d_minus_matte_rgb_gaming_mouse_1-_tejar.jpg"),
    Product(
        name: "GoPro HERO12 Black",
        desc: """HDR (High Dynamic Range) Video + Photo for more vivid images
Longer runtimes, including 1.5 hours at 5.3K30 and over 2.5 hours at 1080p30
Optional Max Lens Mod 2.0 lens accessory enables ultra wide angle, 177-degree field of view in 4K60
New Bluetooth audio support for AirPods + other Bluetooth audio devices for wireless sound recording and voice control""",
        price: "129,999",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/g/o/gopro_hero12_black_action_camera_waterproof_stabilization_1_-_tejar_1.jpg"),
    Product(
        name: "Google Pixel Buds",
        desc: """Connectivity Each earbud: Bluetooth 5.0
Custom-designed 12mm dynamic speaker driver
Passive noise reduction
Spatial vent for in-ear pressure reduction and spatial awareness""",
        price: "39,799",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/g/o/google_pixel_buds_a-series_2-_tejar.jpg"),
    Product(
        name: "Havit MS1005",
        desc: """Adjustable Weights Function
RGB Gaming Mouse-7 kinds of light effect
Keystroke Life-5000000 Times
Buttons: 7""",
        price: "1,999",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/h/a/havit_ms1005_gaming_mouse_1-_tejar.jpg"),
    Product(
        name: "Insta360 GO 3 Action Camera",
        desc: """Aperture: F2.2
35mm Equivalent Focal Length: 11.24mm
Photo Resolution: 2560x1440 (16:9), 2560x2560 (1:1), 1440x2560 (9:16), 2936x1088 (2.7:1)
Video Resolution: Video: 2.7K: 2720x1536@24/25/30fps, 1440P: 2560x1440@24/25/30/50fps, 1080P: 1920x1080@24/25/30/50fps / FreeFrame Video: 1440P: 2560x1440@24/25/30/50fps, 1080P: 1920x1080@24/25/30/50fps / Timelapse: 1440P: 2560x1440@30fps / TimeShift: 1440P: 2560x1440@15/30fps / Slow Motion: 1080P: 1920x1080@120fps / Pre-Recording: 2.7K: 2720x1536@24/25/30fps, 1440P: 2560x1440@24/25/30/50fps, 1080P: 1920x1080@24/25/30/50fps / Loop Recording: 2.7K: 2720x1536@24/25/30fps, 1440P: 2560x1440@24/25/30/50fps, 1080P: 1920x1080@24/25/30/50fps""",
        price: "130,399",
        image:
            "https://www.tejar.pk/media/catalog/product/cache/3/image/500x/9df78eab33525d08d6e5fb8d27136e95/i/n/insta360_go_3_action_camera1_-_tejar.jpg"),
  ];

// Cart List

  List _cart = [];

// Some Getters
  List get cart => _cart;

// Add To Cart Function
  addToCart(Product item) {
    _cart.add(item);
    debugPrint("$_cart");
    notifyListeners();
  }

// Remove from cart Function
  removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

// Check is product in cart
  bool isProductInCart(Product item) {
    return _cart.contains(item);
  }
}
