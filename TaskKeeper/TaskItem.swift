//
//  TaskItem.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/2/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Cocoa

class TaskItem: NSTableCellView {
   
   //MARK: Properties
   @IBOutlet weak var taskName: NSTextField!
   @IBOutlet weak var statusButton: NSButton!
   
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
