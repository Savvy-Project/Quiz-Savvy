//
//  FavoriteView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    var U: [Quiz] = quizStore.quiz1
    var R: [Quiz] = quizStore.quiz2
    
    var body: some View {
        List {
            ForEach(U) { u in
                if u.favorite == true {
                    Text(u.OKans)
                }
                
            }
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
