//
//  DetailView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizListView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
   
    
    

    @State var num: Int = 2
    
    var body: some View {
        VStack {
            if num == 1 {
                Button(action: {
                    self.userData.situation[0].seni = false
                }) {
                    Text("Back")
                }
                List {
                    ForEach(0..<userData.quizStore1.count, id: \.self) { k in
                        NavigationLink(destination: QuizDetailView(now: self.userData.quizStore1[k], numA: self.num)
                                
                        ) {
                            QuizRowView(i: self.userData.quizStore1[k])
                        }
                    }
                    
                }
                .navigationBarTitle("日常")
                .navigationBarBackButtonHidden(true)
                
                
            }
            
            if num == 2 {
                Button(action: {
                    self.userData.situation[1].seni = false
                }) {
                    Text("Back")
                }
                List {
                    ForEach(0..<userData.quizStore2.count, id: \.self) { o in
                        NavigationLink(destination: QuizDetailView(now: self.userData.quizStore2[o], numA: self.num)) {
                            Text(self.userData.quizStore2[o].title)
                       }
                    }
                }
                .navigationBarTitle("学校")
                .navigationBarBackButtonHidden(true)
                
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
