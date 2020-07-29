//
//  HomeView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/28.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    @State var selection = 1
    
    var body: some View {
        ZStack {
            Page1()
                .opacity(selection == 1 ? 1 : 0)
                .offset(x :selection == 1 ? 0 : 100)
                .animation(Animation.spring())
            
            Page2()
                .opacity(selection == 2 ? 1 : 0)
                .offset(x : selection == 2 ? 0 : 100)
                .animation(Animation.spring())
            
            Page3()
                .opacity(selection == 3 ? 1 : 0)
                .offset(x : selection == 3 ? 0 : 100)
                .animation(Animation.spring())
            
            ContentView(selection: $selection)
        }
    }
}

struct ContentView: View {
    @Binding var selection: Int
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: width, height: 88)

                HStack(spacing: 80) {
                    Button(action: {
                        self.selection = 1
                    }) {
                        VStack {
                            Image(systemName: "film")
                                .foregroundColor(Color.red)
                                .font(.system(size: 30, weight: .bold, design: .rounded))

                        }
                    }.padding(.bottom, 15)


                    Button(action: {
                        self.selection = 2
                    }) {
                        VStack {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(Color.yellow)
                                .font(.system(size: 32, weight: .bold, design: .rounded))

                        }
                    }.padding(.bottom, 15)

                    Button(action: {
                        self.selection = 3
                    }) {
                        VStack {
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(Color.green)
                                .font(.system(size: 33, weight: .bold, design: .rounded))

                        }
                    }.padding(.bottom, 15)

                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Page1: View {
    var body: some View {
        TopView()
    }
}
struct Page2: View {
    var body: some View {
        ChooseView(items: situationStore)
    }
}

struct Page3: View {
    var body: some View {
        FavoriteView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}











