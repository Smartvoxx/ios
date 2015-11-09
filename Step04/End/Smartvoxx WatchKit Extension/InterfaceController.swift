//
//  InterfaceController.swift
//  Smartvoxx WatchKit Extension
//
//  Created by Sebastien Arbogast on 24/10/2015.
//  Copyright © 2015 Epseelon. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var table: WKInterfaceTable!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        Devoxx.sharedInstance.loadSchedulesForConference("DV15") { (schedules:[Schedule]) -> (Void) in
            self.table.setNumberOfRows(schedules.count, withRowType: "Schedule")
            for (index, schedule) in schedules.enumerate() {
                guard let scheduleRowController = self.table.rowControllerAtIndex(index) as? ScheduleRowController else {
                    print("Error in table configuration")
                    return
                }
                scheduleRowController.titleLabel.setText(schedule.title)
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}