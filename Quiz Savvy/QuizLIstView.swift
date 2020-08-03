//
//  DetailView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizListView: View {
    @EnvironmentObject var userData: UserData
    

    @State var num: Int = 2
    
    var body: some View {
        VStack {
            if num == 1 {
                List {
                    ForEach(0..<userData.quizStore1.count, id: \.self) { k in
                        NavigationLink(destination: QuizDetailView(now: self.userData.quizStore1[k], numA: self.num)) {
                            Text(self.userData.quizStore1[k].title)
                        }
                    }
                }
                .navigationBarTitle("日常")
                
            }
            if num == 2 {
                List {
                    ForEach(0..<userData.quizStore2.count, id: \.self) { o in
                        NavigationLink(destination: QuizDetailView(now: self.userData.quizStore2[o], numA: self.num)) {
                            Text(self.userData.quizStore2[o].title)
                       }
                    }
                }
                .navigationBarTitle("学校")
                
            }
        }
        
    }
}




struct QuizListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
            .environmentObject(UserData())
    }
}
