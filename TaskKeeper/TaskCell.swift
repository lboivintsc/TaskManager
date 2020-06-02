//
//  TaskCell.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/2/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Cocoa

class TaskCell: NSTableView {
   
   //MARK: Properties
    
   var tasks = [Task]()
   
   
   //MARK: Private Methods
    
   private func loadSampleTasks() {
      
      guard let task1 = Task(name: "Clean Room", status: true) else {
         fatalError("Unable to instantiate task1")
      }
      
      guard let task2 = Task(name: "Do Laundry", status: false) else{
         fatalError("Unable to instantiate task2")
      }
      
      guard let task3 = Task(name: "Walk Dog", status: true) else{
         fatalError("Unable to instantiate task3")
      }
      
      tasks += [task1, task2, task3]
       
   }

}
