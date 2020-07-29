//
//  QuizAnswerView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/05.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizAnswerView: View {
    @Environment(\.presentationMode) var presentation
    @State var ans: Bool = false
    @State var Return: Bool = false
    @State var Star: Bool = false
    @State var quizes: Quiz
    
    var numB: Int = 1
    
    
    var body: some View {
      
            VStack {
                AnswerFragView(ans: ans)
                    .padding()
                HStack {
                    Text("今回のフレーズ:")
                    Text(quizes.OKans)
                }.padding()
                
                Text(quizes.sentence)
                
                Button(action: {
                    self.Star.toggle()
                }) {
                    if Star {
                        Image(systemName: "star.fill")
                        
                    }else {
                        Image(systemName: "star")
                    }
                }
                
                
                
                HStack {
                    Button(action: {
                        self.Return.toggle()
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Top")
                        
                    }
                    
                    
                    
                }
            }.navigationBarHidden(true)
       
    }
}


struct AnswerFragView: View {
    var ans: Bool = false 
    var body: some View {
        if ans == true {
            return Text("まる")
        } else {
            return Text("ばつ")
        }
    }
}

struct QuizAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuizAnswerView(quizes: quizStore.quiz1[0])
    }
}


