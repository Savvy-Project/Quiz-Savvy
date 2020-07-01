//
//  StartView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 300.0){
                Text("青梗菜2")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding()
                    
                NavigationLink(destination: HomeView()){
                    Text("Start")
                        .font(.largeTitle)
                }
            }
            
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
