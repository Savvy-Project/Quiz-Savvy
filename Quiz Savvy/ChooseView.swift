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
                        NavigationLink(destination: DetailView()) {
                            item.image
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 155, height: 155)
                            
                        }
                        Text(item.type)
                            .font(.largeTitle)
                    }
                }
            }
            .navigationBarTitle("buriburi")
        }
    }
}


struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView(items: quizStore.quizs)
    }
}
