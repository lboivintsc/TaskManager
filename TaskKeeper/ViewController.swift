//
//  ViewController.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/1/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
   
   //MARK: Properties

   @IBOutlet weak var listItemLabel: NSTextField!
   @IBOutlet weak var itemTextField: NSTextField!
   

   override func viewDidLoad() {
      super.viewDidLoad()
      // tell the controller's view to use a CALayer as its backing store
      view.wantsLayer = true
      // change the background color of the layer
      view.layer?.backgroundColor = NSColor.black.cgColor
      // Handle the text field’s user input through delegate callbacks.
      itemTextField.delegate = self
      //self.window.backgroundColor = NSColor.black.cgColor
   }

   override var representedObject: Any? {
      didSet {
      // Update the view, if already loaded.
      }
   }
   //MARK: NSTextFieldDelegate
   
   func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
      if let textField = control as? NSTextField {
         textField.resignFirstResponder()
         self.textFieldDidEndEditing(textField)
         return true
      }
      return false
   }
   
   func textFieldDidEndEditing(_ textField: NSTextField) {
      listItemLabel.stringValue = textField.stringValue
      DispatchQueue.main.async {
          textField.window?.makeFirstResponder(nil)
      }
   }
   

   //MARK: Actions
   
   @IBAction func setDefaultLabelText(_ sender: NSButton) {
      listItemLabel.stringValue = "Default Text"
   }
   
}

