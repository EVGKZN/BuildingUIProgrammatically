//
//  Task.swift
//  BuildingUIProgrammatically
//
//  Created by Евгений on 30.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

struct Task {
    
    var text: String
    var category: Categories
    var time: String?
    var date: String?
    var hasTimeCondition: Bool
    var isMarked: Bool
    var isNeedToBeWhiteAppearance: Bool
}
