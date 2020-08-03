//
//  QuizRow.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/03.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizDetailView: View {
    @EnvironmentObject var userData: UserData
    @State var showingDetail1 = false
    @State var showingDetail2 = false
    @State var ans1: Bool = false
    @State var ans2: Bool = false
    @State var list: [String] = []
    @State var showText = false
    @State var result = true
    @State var titleon = true
    @State var explainon = false
    
    var now: Quiz
    var i: Int = 0
    var numA: Int = 0
    
    var body: some View {
        
            VStack {
                if titleon{
                    Text(now.title)
                    .font(.largeTitle)
                }
                
                if explainon{
                    Text(now.explain)
                    .font(.headline)
                }
                
                Spacer()
                if result {
                    Button(action: {
                        self.list = []
                        self.list.append(self.now.OKans)
                        self.list.append(self.now.BADans)
                        self.list.shuffle()
                        self.result.toggle()
                        self.showText.toggle()
                        self.titleon.toggle()
                        self.explainon.toggle()
                }) {
                    Image(systemName: "circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 155, height: 155)
                        .clipShape(Circle())
                }
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
                            .foregroundColor(Color.white)
                            .font(.headline)
                        }
                        NavigationLink(destination: QuizAnswerView(ans: self.ans1, quizes: now, numB: numA), isActive: $showingDetail1) {
                            EmptyView()
                        }
                    
                    }.navigationBarHidden(true)
                    
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
                            .foregroundColor(Color.white)
                            .font(.headline)
                        }
                        NavigationLink(destination:  QuizAnswerView(ans: self.ans2, quizes: now, numB: numA), isActive: $showingDetail2) {
                            EmptyView()
                        }
                    }.navigationBarHidden(true)
                }
            }.navigationBarHidden(true)
         .padding(.bottom,88)
    }
}


struct QuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return QuizDetailView(now: userData.quizStore1[0])
                    .environmentObject(userData)
    }
}

