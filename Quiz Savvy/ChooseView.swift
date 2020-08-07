//
//  ChooseView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct ChooseView: View {
    @EnvironmentObject var userData: UserData
    var item: Situation
    var quiz1Index: Int {
        userData.situation.firstIndex(where: { $0.id == item.id })!
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing:30.0) {
                   
                NavigationLink(destination: QuizListView(num: item.quiznum), isActive: $userData.situation[self.quiz1Index].seni) {
                        Button(action: {
                            self.userData.situation[self.quiz1Index].seni.toggle()
                        }) {
                            ZStack {
                                item.image
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 280, height: 180)
                                .border(Color.green,width:8)
                                .cornerRadius(10)
                                
                                Text(item.type)
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                            }
                            
                        }

                    
                
                }
                .isDetailLink(false)
                .navigationBarTitle("Situation")
           
            
            }
        }
         .padding(.bottom,88)
    }
    
}


struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ChooseView(item: userData.situation[0])
                    .environmentObject(userData)
    }
}
