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
    var items: [Situation]
    var situation1Index: Int {
        userData.situation.firstIndex(where: { $0.id == items[0].id })!
    }
    var situation2Index: Int {
        userData.situation.firstIndex(where: { $0.id == items[1].id })!
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing:30.0) {
                   
                NavigationLink(destination: QuizListView(num: items[0].quiznum), isActive: $userData.situation[self.situation1Index].seni) {
                        Button(action: {
                            self.userData.situation[self.situation1Index].seni.toggle()
                        }) {
                            ZStack {
                                items[0].image
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 280, height: 180)
                                .border(Color.green,width:8)
                                .cornerRadius(10)
                                
                                Text(items[0].type)
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                            }
                    }
                }
                .isDetailLink(false)
                
                NavigationLink(destination: QuizListView(num: items[1].quiznum), isActive: $userData.situation[self.situation2Index].seni) {
                        Button(action: {
                            self.userData.situation[self.situation2Index].seni.toggle()
                        }) {
                            ZStack {
                                items[1].image
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 280, height: 180)
                                .border(Color.green,width:8)
                                .cornerRadius(10)
                                
                                Text(items[1].type)
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                            }
                    }
                }
                .isDetailLink(false)
            }
            .navigationBarTitle("Situation")
        }
         .padding(.bottom,88)
    }
    
}

struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ChooseView(items: userData.situation)
                    .environmentObject(userData)
    }
}
