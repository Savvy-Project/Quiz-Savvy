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
    var quiz1Index: Int {
        userData.quizStore1.firstIndex(where: { $0.id == i.id })!
    }
    
    var quiz2Index: Int {
        userData.quizStore2.firstIndex(where: { $0.id == i.id })!
    }
    var i: Quiz
    var body: some View {
        HStack {
            Text(i.title)
            if userData.quizStore1[self.quiz1Index].already {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            if userData.quizStore2[self.quiz2Index].already {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
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
