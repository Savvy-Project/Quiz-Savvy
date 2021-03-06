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
    var phrase: String = ""
    var sentence: String = ""
    var numB: Int = 1
    
    
    var body: some View {
      
            VStack {
                AnswerFragView(ans: ans)
                    .padding()
                HStack {
                    Text("今回のフレーズ:")
                    Text(phrase)
                }.padding()
                
                Text(sentence)
                
                HStack {
                    Button(action: {
                        self.Return.toggle()
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Top")
                        
                    }
                    
                    Button(action: {
                        self.Next.toggle()
                    }) {
                        Text("次の問題へ")
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
            return Text("まる")
        } else {
            return Text("ばつ")
        }
    }
}

struct QuizAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuizAnswerView()
    }
}


