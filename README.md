📱 Product Task App

📖 Overview
 Link GitHub Repo ---> https://github.com/khaled338/my_task
A simple Flutter app to display a list of products from a REST API with offline support.

When online: products are fetched from the API and cached locally.

When offline: cached products are displayed, along with an error banner.

🛠️ Tech Stack

Flutter (UI framework)

GetX (State Management)

SharedPreferences (Data caching)

CachedNetworkImage (Image caching)

🚀 Features

✔️ Fetch products from REST API
✔️ Display products in a scrollable grid
✔️ Show both regular & sale prices with discount styling
✔️ Auto banner slider every 3 seconds
✔️ Offline support with cached data
✔️ Favorite toggle per product
✔️ Error banner when API fetch fails

🚀 State Management Strategy (GetX)

Controller: HomeController

Observables:

isLoading → loading state

products → list of products

errorMessage → error banner text

currentBannerIndex → to control banner slider

Methods:

fetchProducts():

Tries fetching from REST API

If successful → saves products to cache

If failed → loads products from cache

Updates errorMessage when offline

toggleFavorite(Product) → add/remove from favorites

Timer used in onInit to auto-slide banner every 3 second

🚀 UI Structure

HomeScreen:

Banner slider (PageView with auto-slide via Timer).

Error banner displayed when errorMessage is not empty.

Scrollable list of products (GridView).

ProductCard:

Product image:

Uses CachedNetworkImage with offline fallback to cachedImage.

Product name.

Prices:

If product has a discount → show original price (strikethrough) above sale price.

Otherwise → show regular price only.

"Add to Cart" button.

Favorite icon toggle.


🚀Caching Mechanism

Service: CacheService

saveProducts(List<Product>):

Stores product list as JSON (including base64 cached images) in SharedPreferences.

getProducts():

Reads from SharedPreferences.

Converts JSON back to Product objects.

Image caching:

During online fetch, images are downloaded and saved as base64.

During offline mode, cachedImage is displayed if available.

📐 Flow (PseudoCode)

on App Start:
  try to fetch products from API
    if success:
      save products to cache
      display products in UI
    if fail:
      load products from cache
        if cache available:
          show cached products
          show error banner
        else:
          show "No data available"


✅ Requirements Achieved

Fetch products from REST API → Done

Display in scrollable list → Done

Work offline with cached data → Done

Show error banner when offline → Done

State management using GetX → Done

Caching with SharedPreferences + base64 images → Done