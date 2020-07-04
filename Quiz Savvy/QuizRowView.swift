//
//  QuizRow.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/03.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizRowView: View {
    @State var showingDetail = false
    var q: Quiz
    @State var list: [String] = []
    @State var showText = false
    
    
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
                    ForEach(0..<list.count)  { n in
                        Button(action: {self.showingDetail.toggle() }) {
                            Text(self.list[n])
                        }
                    }
                    
                        Button(action: {self.showingDetail.toggle() }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20,style: .continuous)
                                    .fill(Color.yellow)
                                    .frame(width: 200, height: 200)
                                Text(q.BADans)
                            }
                        }.sheet(isPresented: $showingDetail) {
                            Text("bubu")
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
