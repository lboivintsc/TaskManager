//
//  TableController.swift
//  TaskKeeper
//
//  Created by Lindsey Boivin on 6/1/20.
//  Copyright © 2020 Lindsey Boivin. All rights reserved.
//

import Cocoa

class TableController: NSViewController, NSTextFieldDelegate, NSTableViewDelegate, NSTableViewDataSource {
   
   //MARK: Properties
   @IBOutlet weak var transitionButton: NSButton!
   @IBOutlet weak var tableView: NSTableView!
   
   var tasks = [Task]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Load the sample data.
      loadSampleTasks()
      
      // tell the controller's view to use a CALayer as its backing store
      view.wantsLayer = true
      // change the background color of the layer
      view.layer?.backgroundColor = NSColor.black.cgColor
      
      tableView.reloadData()
      
      tableView.delegate = self
      tableView.dataSource = self

   }

   override var representedObject: Any? {
      didSet {
      // Update the view, if already loaded.
      }
   }
   
   func getTasks() -> [Task]{
      return tasks
   }
   
   func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {

      if tableColumn!.identifier.rawValue == "TaskColumn"{
         var cell = tableColumn!.dataCell(forRow: row) as? NSTextFieldCell
         if tasks[row].status == false{
            cell?.textColor = NSColor.gray
         }
         return tasks[row].name
      }
      else{
         var im = #imageLiteral(resourceName: "check_empty")
         if tasks[row].status == true{
            im = #imageLiteral(resourceName: "check_filled")
         }
         return im
      }
         
   }
      
      
     
   @IBAction func clickedItem(_ sender: Any) {
      //performSegue(withIdentifier: "itemClicked", sender: self)
      if let controller = self.storyboard?.instantiateController(withIdentifier: "ItemCloseUp") as? ViewController {
      self.view.window?.contentViewController = controller
      }
   }
   
   
   

   func numberOfRows(in tableView: NSTableView) -> Int {
      return tasks.count
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



