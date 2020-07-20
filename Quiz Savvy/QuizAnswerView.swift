//
//  QuizAnswerView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/05.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizAnswerView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var ans: Bool = false
    var phrase: String = ""
    var sentence: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                AnswerFragView(ans: ans)
                    .padding()
                HStack {
                    Text("今回のフレーズ:")
                    Text(phrase)
                }.padding()
                
                Text(sentence)
                    .navigationBarItems(trailing: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        }
                    ) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20,style:       .continuous)
                                    .fill(Color.pink)
                                    .frame(width: 200, height: 50)
                                Text("次の問題へ")
                        }})
            }
        }
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


