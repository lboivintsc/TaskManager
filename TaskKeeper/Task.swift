//
//  Task.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/2/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Foundation

class Task {
    
    //MARK: Properties
    
    var name: String
    var status: Bool
   
   //MARK: Initialization
    
   init?(name: String, status: Bool) {
       
      // Initialization should fail if there is no name or if the rating is negative.
      if name.isEmpty  {
          return nil
      }
      
      // Initialize stored properties.
      self.name = name
      self.status = status
   }
    
}
