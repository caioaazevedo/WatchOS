//
//  MealConfigInterfaceController.swift
//  MiniWatchTest WatchKit Extension
//
//  Created by Caio Azevedo on 09/06/20.
//  Copyright © 2020 Caio Azevedo. All rights reserved.
//

import WatchKit
import Foundation


class MealConfigInterfaceController: WKInterfaceController {

    @IBOutlet weak var titleText: WKInterfaceTextField!
    @IBOutlet weak var hourPicker: WKInterfacePicker!
    @IBOutlet weak var minutePicker: WKInterfacePicker!
    
    var meals = [Meal]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        guard let meal = context as? Meal else {return}
        
        titleText.setText(meal.title)
        
        var hoursItems = [WKPickerItem]()
        var minutesItems = [WKPickerItem]()
        
        for i in 0..<24 {
            let item = WKPickerItem()
            
            item.title = i<10 ? "0\(String(i))": String(i)
            hoursItems.append(item)
        }
        hourPicker.setItems(hoursItems)
        
        for i in 0..<60 {
            let item = WKPickerItem()
            item.title = i<10 ? "0\(String(i))": String(i)
            minutesItems.append(item)
        }
        minutePicker.setItems(minutesItems)
        
        let hour = Calendar.current.component(.hour, from: meal.time)
        let minutes = Calendar.current.component(.minute, from: meal.time)
        
        hourPicker.setSelectedItemIndex(hour)
        minutePicker.setSelectedItemIndex(minutes)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func save() {
    }
    
    @IBAction func remove() {
    }
    
}
