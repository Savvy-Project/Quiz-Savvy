//
//  Timer.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/08/09.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI
import Combine

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
