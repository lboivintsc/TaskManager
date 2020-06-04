//
//  TaskTextFieldCell.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/4/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Foundation
import Cocoa

class TaskTextFieldCell: NSTextFieldCell {
   
   override func titleRect(forBounds theRect: NSRect) -> NSRect
   {
      var titleFrame = super.titleRect(forBounds: theRect)
       titleFrame.origin.y = theRect.origin.y - 1.0 + (theRect.size.height - 13) / 2.0
       return titleFrame
   }

   override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView)
   {
      let titleRect = self.titleRect(forBounds: cellFrame)

      self.attributedStringValue.draw(in: titleRect)
   }

}
