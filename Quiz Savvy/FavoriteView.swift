//
//  FavoriteView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var userData: UserData
    @State var Sheet = false

    
    
    var body: some View {
        List {
            ForEach(userData.quizStore1) { t in
                if t.favorite == true {
                    Button(action:{
                        self.Sheet.toggle()
                    }) {
                        Text(t.title)
                    }.sheet(isPresented: self.$Sheet) {
                        Text("e")
                    }
                    
                }
            }
            ForEach(userData.quizStore2) { t in
                if t.favorite == true {
                    Button(action:{
                        self.Sheet.toggle()
                    }) {
                        Text(t.title)
                    }.sheet(isPresented: self.$Sheet) {
                        Text("m")
                    }
                }
            }
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
              .environmentObject(UserData())
        
    }
}
