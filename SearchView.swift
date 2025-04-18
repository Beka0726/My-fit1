import SwiftUI

struct SearchView: View {
    @State private var query = ""
    @State private var results: [FoodItem] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите продукт", text: $query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Поиск") {
                    FatSecretAPI.shared.searchFood(query: query) { items in
                        DispatchQueue.main.async {
                            self.results = items
                        }
                    }
                }
                .padding()
                
                List(results) { item in
                    VStack(alignment: .leading) {
                        Text(item.food_name).font(.headline)
                        Text(item.food_description).font(.subheadline)
                    }
                }
            }
            .navigationTitle("Поиск продуктов")
        }
    }