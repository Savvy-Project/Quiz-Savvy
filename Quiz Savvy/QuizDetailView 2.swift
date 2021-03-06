//
//  QuizRow.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/03.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizDetailView: View {
    @State var showingDetail1 = false
    @State var showingDetail2 = false
    @State var ans1: Bool = false
    @State var ans2: Bool = false
    @State var list: [String] = []
    @State var showText = false
    var now: Quiz
    var next: Quiz
    var i: Int = 0
    var numA: Int = 0
    
    var body: some View {
        
            VStack {
                Text(now.title)
                Text(now.explain)
                Spacer()
                Button(action: {
                    self.list = []
                    self.list.append(self.now.OKans)
                    self.list.append(self.now.BADans)
                    self.list.shuffle()
                    self.showText.toggle()
                }) {
                    Text("result")
                        .padding(.bottom)
                        .frame(height: 200.0)
                }
                if showText {
                    Button(action: {
                        self.showingDetail1.toggle()
                        if self.list[0] == self.now.OKans {
                            self.ans1 = true
                        }else {
                            self.ans1 = false
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20,style: .continuous)
                                .fill(Color.yellow)
                                .frame(width: 200, height: 100)
                            Text(list[0])
                        }
                        NavigationLink(destination: QuizAnswerView(ans: self.ans1, phrase: self.now.OKans, sentence: self.now.correct, numB: numA), isActive: $showingDetail1) {
                            EmptyView()
                        }
                    
                    }
                    
                    Button(action: {
                        self.showingDetail2.toggle()
                        if self.list[1] == self.now.OKans {
                            self.ans2 = true
                        }else {
                            self.ans2 = false
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20,style: .continuous)
                                .fill(Color.red)
                                .frame(width: 200, height: 100)
                            Text(list[1])
                        }
                        NavigationLink(destination:  QuizAnswerView(ans: self.ans2, phrase: self.now.OKans,sentence: self.now.correct, numB: numA), isActive: $showingDetail2) {
                            EmptyView()
                        }
                    }
                }
            }.navigationBarHidden(true)
       
        
    }
}


struct QuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuizDetailView(now: quizStore.quiz1[0], next: quizStore.quiz1[1])
    }
}
