//
//  DetailView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizDetailView: View {

    var num: String = ""
    
    var body: some View {
        Text(num)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuizDetailView()
    }
}