//
//  QuizRowView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/22.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizRowView: View {
    @EnvironmentObject var userData: UserData
    var nums: Int = 1
    
    var i: Quiz
    var body: some View {
        HStack {
            
            Text(i.title)
                .foregroundColor(Color.white)
                .padding(.init(10))
                
            Spacer()
            
            if i.already {
                Image(systemName: "checkmark")
                    .frame(width: 30, height: 30)
                    .border(Color.black)
                    .foregroundColor(Color.green)
                    .padding()
            }
            else{
                Image(systemName: "checkmark")
                .resizable()
                .frame(width: 30, height: 30)
                    .border(Color.black,width: 3)
                    .foregroundColor(Color.gray)
                .padding()
            }
            

        }.frame(minWidth: 0,  maxWidth: .infinity, minHeight: 80,maxHeight: 80 ,alignment: .leading)
            .background(Color.gray)
        .cornerRadius(10)
    }
}

struct QuizRowView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return QuizRowView(i: userData.quizStore1[0])
                    .environmentObject(userData)
    }
}
