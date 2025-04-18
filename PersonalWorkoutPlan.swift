// PersonalWorkoutPlan.swift

import Foundation

struct WorkoutDay: Identifiable {
    let id = UUID()
    let day: String
    let title: String
    let warmup: String?
    let exercises: [Exercise]
    let cardio: String?
    let notes: String?
}

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let sets: String
    let rest: String
}

struct WeeklyPlan {
    static let plan: [WorkoutDay] = [
        WorkoutDay(
            day: "Пн",
            title: "Спина + задние дельты",
            warmup: "10 минут эллипсоид/велотренажер + вращения плечами",
            exercises: [
                Exercise(name: "Становая тяга с гантелями", sets: "4х8–10", rest: "90 сек"),
                Exercise(name: "Подтягивания широким хватом", sets: "4х6–8", rest: "2 мин"),
                Exercise(name: "Тяга штанги в наклоне", sets: "4х8–10", rest: "90 сек"),
                Exercise(name: "Тяга горизонтального блока", sets: "3х12–15", rest: "60 сек"),
                Exercise(name: "Махи гантелями в наклоне", sets: "3х15", rest: "60 сек")
            ],
            cardio: "20 минут ходьбы в горку или эллипсоид",
            notes: nil
        ),
        WorkoutDay(
            day: "Вт",
            title: "Грудь + Плечи",
            warmup: "5 минут скакалка + вращения руками",
            exercises: [
                Exercise(name: "Жим гантелей лежа", sets: "4х8–10", rest: "90 сек"),
                Exercise(name: "Жим гантелей на наклонной", sets: "4х8–10", rest: "90 сек"),
                Exercise(name: "Разведение гантелей", sets: "3х12–15", rest: "60 сек"),
                Exercise(name: "Армейский жим сидя", sets: "4х10–12", rest: "90 сек"),
                Exercise(name: "Махи в стороны", sets: "3х15", rest: "60 сек")
            ],
            cardio: "15 мин интервальной ходьбы",
            notes: nil
        ),
        WorkoutDay(
            day: "Ср",
            title: "Активное восстановление",
            warmup: nil,
            exercises: [],
            cardio: nil,
            notes: "Йога (30–40 мин), плавание (30 мин)"
        ),
        WorkoutDay(
            day: "Чт",
            title: "Ноги + Ягодицы",
            warmup: "10 минут ходьбы",
            exercises: [
                Exercise(name: "Приседания с гантелями", sets: "4х10–12", rest: "90 сек"),
                Exercise(name: "Румынская тяга", sets: "4х12", rest: "90 сек"),
                Exercise(name: "Выпады назад", sets: "3х10 на ногу", rest: "60 сек"),
                Exercise(name: "Ягодичный мостик", sets: "4х15", rest: "60 сек"),
                Exercise(name: "Зашагивания", sets: "3х12 на ногу", rest: "60 сек")
            ],
            cardio: "10 минут растяжки",
            notes: nil
        ),
        WorkoutDay(
            day: "Пт",
            title: "Руки + Пресс",
            warmup: "5 минут гребли (резинка)",
            exercises: [
                Exercise(name: "Подъем штанги на бицепс", sets: "4х8–10", rest: "90 сек"),
                Exercise(name: "Отжимания на брусьях", sets: "4х8–10", rest: "90 сек"),
                Exercise(name: "Молотковые сгибания", sets: "3х12", rest: "60 сек"),
                Exercise(name: "Французский жим", sets: "3х12", rest: "60 сек"),
                Exercise(name: "Скручивания с роликом", sets: "3х15", rest: "30 сек"),
                Exercise(name: "Подъем ног в висе", sets: "3х12–15", rest: "30 сек")
            ],
            cardio: "20 минут велотренажер (пульс 120–130)",
            notes: nil
        )
    ]
}