//
//  TableController.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/1/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Cocoa

class TableController: NSViewController, NSTextFieldDelegate {
   
   //MARK: Properties
   @IBOutlet weak var transitionButton: NSButton!
   
   var tasks = [Task]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Load the sample data.
      loadSampleTasks()
      
      // tell the controller's view to use a CALayer as its backing store
      view.wantsLayer = true
      // change the background color of the layer
      view.layer?.backgroundColor = NSColor.black.cgColor
      // Handle the text field’s user input through delegate callbacks.
      //itemTextField.delegate = self
   }

   override var representedObject: Any? {
      didSet {
      // Update the view, if already loaded.
      }
   }

   

   //MARK: Actions
   @IBAction func buttonTransition(_ sender: NSButton) {
      
      if let controller = self.storyboard?.instantiateController(withIdentifier: "ItemView") as? ViewController {
      self.view.window?.contentViewController = controller
      }
   }
   
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

