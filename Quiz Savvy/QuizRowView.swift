//
//  QuizRowView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/22.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizRowView: View {
    @EnvironmentObject var userData: UserData
    var nums: Int = 1
    
    var i: Quiz
    var body: some View {
        HStack {
            Text(i.title)
            
            if i.already {
                Text("まん")
            }
        }
    }
}

struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return QuizRowView(i: userData.quizStore1[0])
                    .previewLayout(.fixed(width: 400, height: 80))
                    .environmentObject(userData)
    }
}
