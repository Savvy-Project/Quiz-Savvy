//
//  ChooseView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct ChooseView: View {
    var items: [Situation]
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(self.items) { item in
                   ZStack{
                    NavigationLink(destination: QuizListView(num: item.quiznum)) {
                            item.image
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 280, height: 180)
                            .cornerRadius(10)
                            
                        }
                        Text(item.type)
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)

                    }
                }
            }
            .navigationBarTitle("Situation")
            
            
        }
        .padding(.top,-45)
    }
}


struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView(items: situationStore)
    }
}
