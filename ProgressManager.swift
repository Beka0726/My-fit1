// ProgressManager.swift

import Foundation
import UserNotifications

class ProgressManager: ObservableObject {
    static let shared = ProgressManager()
    
    @Published var completedDays: Set<String> {
        didSet {
            UserDefaults.standard.set(Array(completedDays), forKey: "completedDays")
        }
    }
    
    private init() {
        let saved = UserDefaults.standard.stringArray(forKey: "completedDays") ?? []
        completedDays = Set(saved)
    }
    
    func toggleDay(_ day: String) {
        if completedDays.contains(day) {
            completedDays.remove(day)
        } else {
            completedDays.insert(day)
        }
    }
    
    func resetProgress() {
        completedDays.removeAll()
    }
    
    func isCompleted(_ day: String) -> Bool {
        return completedDays.contains(day)
    }
}