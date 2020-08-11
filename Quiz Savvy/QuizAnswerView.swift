//
//  QuizAnswerView.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/05.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct QuizAnswerView: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentation
    @State var ans: Bool = false
    @State var Return: Bool = false
    @State var Star: Bool = false
    @State var quizes: Quiz
    @State var Next = false
    @State var sound = false
    var test = AudioPlayer()
    let userDefaults = UserDefaults.standard

    var quiz1Index: Int {
        userData.quizStore1.firstIndex(where: { $0.id == quizes.id })!
    }
    
    var quiz2Index: Int {
        userData.quizStore2.firstIndex(where: { $0.id == quizes.id })!
    }
    var numB: Int = 1
    
    
    var body: some View {
        VStack {
            VStack(spacing: 50){
                AnswerFragView(ans: ans)
                HStack{
                    Text(quizes.OKans)
                        .lineLimit(nil)
                        .font(.title)
                                                    
                    if numB == 1 {
                        Button(action: {
                            self.userData.quizStore1[self.quiz1Index].favorite.toggle()
                        }) {
                            if
                                self.userData.quizStore1[self.quiz1Index].favorite  {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(Color.yellow)
                                    .frame(width: 40, height: 40)
                            }else {
                                Image(systemName: "star")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 40, height: 40)
                            }
                        }
                                        
                    }else if numB == 2 {
                        Button(action: {
                            self.userData.quizStore2[self.quiz2Index].favorite.toggle()
                        }) {
                            if self.userData.quizStore2[self.quiz2Index].favorite {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(Color.yellow)
                                    .frame(width: 30, height: 30)
                                                
                            }else {
                                Image(systemName: "star")
                                    .resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }
            }
            .frame(width: 280, height: 200)
            Spacer()
                
            VStack(alignment: .leading){
                HStack{
                    Text("解説")
                        .font(.headline)
                        
                    Button(action: {
                        self.sound.toggle()
                            if self.sound {
                                self.test.userName = "music1"
                                self.test.playAudio()
                            } else {
                                self.test.stopAudio()

                            }
                                
                    }) {
                        Image(systemName: "speaker.fill")
                            .resizable()
                            .foregroundColor(Color.red)
                            .frame(width: 20, height: 20)
                            .onDisappear {
                                self.test.stopAudio()
                            }
                    }
                }
                        
                Text(quizes.sentence)
                    .lineLimit(nil)
                    
            }
            .frame(width: 300, height:350 , alignment: .topLeading)
            .padding(.top)
            Spacer()
                
                
                
            HStack(spacing: 20) {
                Button(action: {
                        self.Return.toggle()
                }) {
                    Text("Top")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 40)
                        .background(Color.yellow)
                        .cornerRadius(10)
                    NavigationLink(destination: QuizListView(num: numB), isActive: $Return) {
                            EmptyView()
                    }
                }
                    
                Button(action: {
                    self.Next.toggle()
                }) {
                    Text("次の問題へ")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 40)
                        .background(Color.green)
                        .cornerRadius(10)
                    NavigationLink(destination: QuizListView(num: numB), isActive: $Next) {
                            EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .padding(.bottom,88)
        .padding(.top,80)
    }
}


struct AnswerFragView: View {
    var ans: Bool = false
    var body: some View {
        if ans == true {
            return Image(systemName: "circle")
            .resizable()
            .frame(width: 60, height: 60)
        } else {
            return Image(systemName: "multiply")
            .resizable()
            .frame(width: 60, height: 60)
        }
    }
}


struct QuizAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return QuizAnswerView(quizes: userData.quizStore1[0])
                    .environmentObject(userData)
    }
}


