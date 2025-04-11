# 🛒 iOS Technical Task – Product Manager App

This app is a solution to the iOS technical task that fetches products from a REST API, stores them locally, and displays them using SwiftUI. The app architecture is based on **MVVM** and uses **Combine** for reactive data flow.

---

## ✅ Features

- [x] Fetch product list from [dummyjson.com/products](https://dummyjson.com/products)
- [x] Display product list with title, image, and rating indicator
- [x] Show product details with price, discount, stock and description
- [x] Save products locally on first launch using `FileManager`
- [x] Load from local cache if already saved
- [x] Clean MVVM architecture using Combine

---

## 🧱 Architecture

- `Model`: Codable structs from API
- `ViewModel`: Handles state, API calls and local storage
- `Service`: `ProductService` with Combine and `NetworkManager`
- `Storage`: `ProductFileManager` using FileManager and JSON
- `UI`: SwiftUI views and navigation

---

## 🚀 How to Run

1. Clone the project:
   ```bash
   git clone https://github.com/rezash76/productTaskDemo.git
