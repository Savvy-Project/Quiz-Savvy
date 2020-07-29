//
//  UserData.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var isFavorite = false
    @Published var quizStores = quizStore
}

