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
        VStack{
            Text("Favorite")
                .font(.largeTitle)
            List {
                ForEach(userData.quizStore1) { t in
                    if t.favorite == true {
                        Button(action:{
                            self.Sheet.toggle()
                        }) {
                            Text(t.title)
                        }.sheet(isPresented: self.$Sheet) {
                            FavoriteDetailView(r: t)
                        }
                        
                    }
                }
                .onDelete { offsets in
                    self.userData.quizStore1.remove(atOffsets: offsets)
                }
                
                ForEach(userData.quizStore2) { t in
                    if t.favorite == true {
                        Button(action:{
                            self.Sheet.toggle()
                        }) {
                            Text(t.title)
                        }.sheet(isPresented: self.$Sheet) {
                            FavoriteDetailView(r: t)
                        }
                    }
                }
                .onDelete { offsets in
                    self.userData.quizStore2.remove(atOffsets: offsets)
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
