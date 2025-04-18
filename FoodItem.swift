import Foundation

struct FoodItem: Identifiable, Decodable {
    let id = UUID()
    let food_name: String
    let food_description: String
    
    enum CodingKeys: String, CodingKey {
        case food_name
        case food_description
    }
}

struct FoodsResponse: Decodable {
    let foods: FoodsWrapper
}

struct FoodsWrapper: Decodable {
    let food: [FoodItem]
}