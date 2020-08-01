//
//  FavoriteDetailView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/08/01.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct FavoriteDetailView: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    var r: Quiz
    
    var body: some View {
        NavigationView{
            VStack {
                Text(r.OKans)
                Text(r.sentence)
                    .navigationBarItems(trailing: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("close")
                    })
                
            }
        }
        
    }
}

struct FavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return FavoriteDetailView(r: userData.quizStore1[0])
                    .environmentObject(userData)
    }
}
