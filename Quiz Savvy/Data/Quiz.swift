//
//  Quiz.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/07/03.
//  Copyright © 2020 青木智大. All rights reserved.
//

import SwiftUI

struct Quiz : Hashable,Codable,Identifiable {
    public var id: String
    public var title: String
    public var explain: String
    public var OKans: String
    public var BADans: String
    public var favorite: Bool
}

