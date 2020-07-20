//
//  QuizRow.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/03.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizRowView: View {
    @State var showingDetail1 = false
    @State var showingDetail2 = false
    @State var ans1: Bool = false
    @State var ans2: Bool = false
    var q: Quiz
    @State var list: [String] = []
    @State var showText = false
    @State var Return: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(q.title)
                Text(q.explain)
                Spacer()
                Button(action: {
                    self.list = []
                    self.list.append(self.q.OKans)
                    self.list.append(self.q.BADans)
                    self.list.shuffle()
                    self.showText.toggle()
                }) {
                    Text("result")
                }
                if showText {
                    Button(action: {
                        self.showingDetail1.toggle()
                        if self.list[0] == self.q.OKans {
                            self.ans1 = true
                        }else {
                            self.ans1 = false
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20,style: .continuous)
                                .fill(Color.yellow)
                                .frame(width: 200, height: 200)
                            Text(list[0])
                        }
                    }.sheet(isPresented: $showingDetail1, onDismiss: { self.Return.toggle()}) {
                        QuizAnswerView(ans: self.ans1, phrase: self.q.OKans,sentence: self.q.correct)
                    }
                    NavigationLink(destination: QuizDetailView(),isActive: $Return) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        self.showingDetail2.toggle()
                        if self.list[1] == self.q.OKans {
                            self.ans2 = true
                        }else {
                            self.ans2 = false
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20,style: .continuous)
                                .fill(Color.red)
                                .frame(width: 200, height: 200)
                            Text(list[1])
                        }
                }.sheet(isPresented: $showingDetail2, onDismiss: { self.Return.toggle()}) {
                        QuizAnswerView(ans: self.ans2, phrase: self.q.OKans,
                                       sentence: self.q.correct)
                    }
                    NavigationLink(destination: QuizDetailView(),isActive: $Return) {
                        EmptyView()
                    }
                }
            }
        }
    }
}


struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        QuizRowView(q: quizStore.quiz1[0])
    }
}
