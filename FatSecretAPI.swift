import Foundation

struct FatSecretToken: Decodable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let scope: String
}

class FatSecretAPI {
    static let shared = FatSecretAPI()
    
    private let clientID = "298d9e0edfdd4ec1a03efbda33385aa"
    private let clientSecret = "d333f9dabb9d4650bd2f9c66b49276a5"
    private var token: String?
    
    func getAccessToken(completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://oauth.fatsecret.com/connect/token") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let authString = "\(clientID):\(clientSecret)"
        guard let authData = authString.data(using: .utf8) else { return }
        let base64Auth = authData.base64EncodedString()
        request.addValue("Basic \(base64Auth)", forHTTPHeaderField: "Authorization")
        
        let body = "grant_type=client_credentials&scope=basic"
        request.httpBody = body.data(using: .utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let decoded = try? JSONDecoder().decode(FatSecretToken.self, from: data) else {
                print("Ошибка получения токена:", error?.localizedDescription ?? "Неизвестно")
                completion(nil)
                return
            }
            self.token = decoded.access_token
            print("Токен получен:", decoded.access_token)
            completion(decoded.access_token)
        }.resume()
    }
}


    func searchFood(query: String, completion: @escaping ([FoodItem]) -> Void) {
        getAccessToken { token in
            guard let token = token else {
                completion([])
                return
            }
            
            var components = URLComponents(string: "https://platform.fatsecret.com/rest/server.api")!
            components.queryItems = [
                URLQueryItem(name: "method", value: "foods.search"),
                URLQueryItem(name: "format", value: "json"),
                URLQueryItem(name: "search_expression", value: query)
            ]
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("Нет данных: \(error?.localizedDescription ?? "")")
                    completion([])
                    return
                }
                do {
                    let decoded = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    completion(decoded.foods.food)
                } catch {
                    print("Ошибка парсинга:", error)
                    completion([])
                }
            }.resume()
        }
    }