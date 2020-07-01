//
//  quiz.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/29.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct Situation : Hashable,Codable,Identifiable {
    public var id: String
    public var type: String
    public var imageName: String
    public var image: Image { Image(imageName) }
    public var quiz: Quiz
}

struct Quiz : Hashable,Codable,Identifiable {
    public var id: String
    public var title: String
    public var explain: String
    public var OKans: String
    public var BADans: String
    public var favorite: Bool
}

