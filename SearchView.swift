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
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Фит-калькулятор</title>
  <style>
    body {
      font-family: Arial;
      max-width: 500px;
      margin: 40px auto;
      padding: 20px;
      background-color: #f0f8ff;
      border-radius: 10px;
    }
    h1 {
      text-align: center;
      color: #333;
    }
    label {
      display: block;
      margin: 10px 0 5px;
    }
    input, select {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 5px;
    }
    #result {
      margin-top: 20px;
      font-weight: bold;
      text-align: center;
    }
  </style>
</head>
<body>
  <h1>Фит-калькулятор</h1>

  <label>Возраст:</label>
  <input type="number" id="age">

  <label>Вес (кг):</label>
  <input type="number" id="weight">

  <label>Рост (см):</label>
  <input type="number" id="height">

  <label>Пол:</label>
  <select id="gender">
    <option value="male">Мужской</option>
    <option value="female">Женский</option>
  </select>

  <label>Активность:</label>
  <select id="activity">
    <option value="1.2">Минимальная</option>
    <option value="1.375">Лёгкая</option>
    <option value="1.55">Средняя</option>
    <option value="1.725">Высокая</option>
    <option value="1.9">Очень высокая</option>
  </select>

  <button onclick="calculateCalories()">Рассчитать калории</button>

  <div id="result"></div>

  <script>
    function calculateCalories() {
      const age = parseInt(document.getElementById('age').value);
      const weight = parseFloat(document.getElementById('weight').value);
      const height = parseFloat(document.getElementById('height').value);
      const gender = document.getElementById('gender').value;
      const activity = parseFloat(document.getElementById('activity').value);

      let bmr;

      if (gender === 'male') {
        bmr = 10 * weight + 6.25 * height - 5 * age + 5;
      } else {
        bmr = 10 * weight + 6.25 * height - 5 * age - 161;
      }

      const total = Math.round(bmr * activity);

      document.getElementById('result').innerHTML = `Ваша суточная норма калорий: ${total} ккал`;
    }
  </script>
</body>
</html>
