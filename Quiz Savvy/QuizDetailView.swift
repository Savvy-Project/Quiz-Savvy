//
//  DetailView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizDetailView: View {

    var num: String = "k"
    
    var body: some View {
        ForEach(quizStore.quiz1.shuffled()) {q in
            QuizRowView(q: q)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuizDetailView()
    }
}
