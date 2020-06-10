//
//  Meal.swift
//  MiniWatchTest WatchKit Extension
//
//  Created by Caio Azevedo on 09/06/20.
//  Copyright © 2020 Caio Azevedo. All rights reserved.
//

import Foundation

public struct Meal {
    var title = String()
    var time = Date()
    var status = Bool()
    
    public init(title: String, time: Date, status: Bool) {
        self.title = title
        self.time = time
        self.status = status
    }
}
