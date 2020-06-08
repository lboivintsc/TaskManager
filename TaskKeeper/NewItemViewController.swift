//
//  NewItemViewController.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/8/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Cocoa

class NewItemViewController: NSViewController, NSTextFieldDelegate {
   
   //MARK: Properties
   
   @IBOutlet weak var listItemLabel: NSTextField!
   @IBOutlet weak var itemTextField: NSTextField!
   @IBOutlet weak var statusButton: NSButton!
   
   /*
    This value is either passed by 'TableController'
    or constructed as part of adding a new task.
    */
   var task: Task?
   
   

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
   
   
   @IBAction func goBack(_ sender: NSButton) {
      if let controller = self.storyboard?.instantiateController(withIdentifier: "TableView") as? TableController {
      self.view.window?.contentViewController = controller
      }
   }
   
   
   @IBAction func saveItem(_ sender: NSButton) {
      
      let name = itemTextField.stringValue
      var status = true
      if (statusButton.state == .on){
         status = false
      }
      
      // Set the task to be passed to TableController after transition
      task = Task(name: name, status: status)
      
      if let controller = self.storyboard?.instantiateController(withIdentifier: "TableView") as? TableController {
         
         controller.unwindToTaskListNew(sender: (self.view.window?.contentViewController!)!)
         self.view.window?.contentViewController = controller
      }
      
   }
   
}


