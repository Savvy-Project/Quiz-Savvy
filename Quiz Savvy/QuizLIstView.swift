//
//  DetailView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizListView: View {
    var a: [Quiz] = quizStore.quiz1
    var b: [Quiz] = quizStore.quiz2
    var x:Int = quizStore.quiz1.count-1
    var y:Int = quizStore.quiz2.count-1
    

    var num: Int = 1
    
    var body: some View {
        VStack {
            if num == 1 {
                List {
                    ForEach(0..<a.count, id: \.self) { k in
                        NavigationLink(destination: QuizDetailView(now: self.a[k], next: self.a[k], numA: self.num)) {
                                Text(self.a[k].title)
                        }
                    }
                }
                
            }
            if num == 2 {
                List {
                    ForEach(0..<b.count, id: \.self) { o in
                        NavigationLink(destination: QuizDetailView(now: self.b[o], next: self.b[o], numA: self.num)) {
                           Text(self.b[o].title)
                       }
                    }
                }
                
                
            }
        }.navigationBarHidden(true)
        
    }
}




struct QuizListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
            
    }
}
