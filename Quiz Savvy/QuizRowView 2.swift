//
//  QuizRowView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/22.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizRowView: View {
    var i: Quiz
    var body: some View {
        HStack {
            Text(i.title)
        }
    }
}

struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuizRowView(i: quizStore.quiz1[0])
            QuizRowView(i: quizStore.quiz1[1])
        }
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
