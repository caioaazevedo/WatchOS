//
//  InterfaceController.swift
//  MiniWatchTest WatchKit Extension
//
//  Created by Caio Azevedo on 09/06/20.
//  Copyright © 2020 Caio Azevedo. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    var meals = [Meal]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        configDefaultMels()
        table.setNumberOfRows(self.meals.count, withRowType: "MealRowType")
        
        for i in 0..<meals.count {
            let controller = table.rowController(at: i) as! MealRowController
            controller.titleLabel.setText(meals[i].title)
            controller.timeLabel.setText(dateFormated(date: meals[i].time))
            if meals[i].status == true {
                controller.status.setTintColor(.green)
            } else {
                controller.status.setTintColor(.red)

            }
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let meal = meals[rowIndex]
        presentController(withName: "Config", context: meal)
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return meals[rowIndex]
    }
    
    func configDefaultMels() {
        self.meals.append(Meal(title: "Café da Manhã", time: dateConfig(hour: 7, minute: 0), status: true))
        self.meals.append(Meal(title: "Lanche da Manhã", time: dateConfig(hour: 11, minute: 0), status: true))
        self.meals.append(Meal(title: "Almoço", time: dateConfig(hour: 13, minute: 0), status: true))
        self.meals.append(Meal(title: "Lanche da Tarde", time: dateConfig(hour: 17, minute: 0), status: true))
        self.meals.append(Meal(title: "Jantar", time: dateConfig(hour: 20, minute: 0), status: false))
    }
    
    func dateConfig(hour: Int, minute: Int) -> Date{
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2001
        dateComponents.month = 1
        dateComponents.day = 1
        dateComponents.timeZone = TimeZone(abbreviation: "BRT") // Japan Standard Time
        dateComponents.hour = hour
        dateComponents.minute = minute

        // Create date from components
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime ?? Date()
    }
    
    func dateFormated(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }

}
