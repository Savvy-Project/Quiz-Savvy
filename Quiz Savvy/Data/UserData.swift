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
    @Published var quizStore1 = quizStore.quiz1
    @Published var quizStore2 = quizStore.quiz2
}
