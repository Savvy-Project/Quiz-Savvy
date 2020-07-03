//
//  QuizRow.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/03.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizRowView: View {
    var q: Situation
    var body: some View {
        NavigationView {
            VStack {
                Text(q.quiz.title)
                Text(q.quiz.explain)
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                    Text(q.quiz.OKans)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color.blue)
                        .frame(width: 200, height: 200)
                    Text(q.quiz.BADans)
                }
            }
        }
        
    }
}

struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowView(q: quizStore.quizs[0])
    }
}
