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
    @State var Next: Bool = false
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
                .frame(width: 400, height: 400)
                
                Button(action: {
                    self.Star.toggle()
                }) {
                    if Star {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: 30, height: 30)
                        
                    }else {
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 30, height: 30)
                    }
                }
                
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        self.Return.toggle()
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Top")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .frame(width: 120, height: 40)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.Next.toggle()
                    }) {
                        Text("次の問題へ")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .frame(width: 120, height: 40)
                            .background(Color.green)
                            .cornerRadius(10)
                            NavigationLink(destination: QuizListView(num: numB), isActive: $Next) {
                                EmptyView()
                        }
                    }
                    
                }
            }.navigationBarHidden(true)
       
    }
}


struct AnswerFragView: View {
    var ans: Bool = false
    var body: some View {
        if ans == true {
            return Image(systemName: "circle")
            .resizable()
            .frame(width: 60, height: 60)
        } else {
            return Image(systemName: "multiply")
            .resizable()
            .frame(width: 60, height: 60)
        }
    }
}


struct QuizAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuizAnswerView(quizes: quizStore.quiz1[0])
    }
}


