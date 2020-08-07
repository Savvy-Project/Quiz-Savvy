//
//  UserData.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/29.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var situation = situationStore
    @Published var quizStore1 = quizStore.quiz1
    @Published var quizStore2 = quizStore.quiz2
    @Published var seni = false
}

class TimerHolder: ObservableObject {
    @Published var timer: Timer!
    @Published var count = 0
    
    func start() {
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.count += 1
        }
    
    }
    func stop() {
        self.timer?.invalidate()
    }
}

