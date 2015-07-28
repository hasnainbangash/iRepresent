//

//  CongressTableViewController,.swift

//  IVote2

//

//  Created by Hasnain Khan on 6/6/15.

//  Copyright (c) 2015 IVote2. All rights reserved.

//



import UIKit



class CongressTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, viewDetailsDelegate, UISearchBarDelegate {
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
   // var items = ["We", "Heart", "Swift"]
    var person = [Info]()
    var point = InfoFactory.sharedInstance
    var firstName  = ""
    var lastName = ""
    
    var cellTransfer : UIStoryboardSegue!
    var cellToSend : Int!
    
    var filterInfo = [Info]()
    
  // var orderedKeys =  //[String]() // to be used to get row data from indexpat
 //   var orderedSet = NSOrderedSet(array: [String]())
    
    var searchResultID : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
         Call2(search: "&chamber=senate") // default start with senate
        point.emptyQueryInfo() // must reset search
          // Call2(search: "") // default start with senate
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //return self.point.getIDlist().count
        if tableView == self.searchDisplayController!.searchResultsTableView {
            
            
            return self.filterInfo.count
        } else {
            return self.point.getIDlist().count
        }
       
    }
    
    
    
    
    
 
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        var infoTest: Info
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            cellToSend = indexPath.row
            infoTest = filterInfo[indexPath.row]
        } else {
            cellToSend = indexPath.row
            infoTest = point.getInfoDictionary()[point.getOrderedKeys()[indexPath.row]]!
            
      
           
        }

        cell.textLabel!.text =  infoTest.getFirstname() + " " + infoTest.getLastname()
      
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    
    
   
   
    
    
    
  
    
    func iFinish(controller: ViewDetails, text: String) {
        println(text)
        self.tableView.reloadData()
        
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        filterInfo = [Info]()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
 
      
        Call2(search: searchBar.text)
        // add search to filter info
        filterInfo.extend(point.getQueryInfo())
        
        point.emptyQueryInfo() // empy searchQuery
        
        
        self.tableView.reloadData()
        
        self.searchDisplayController?.searchResultsTableView.reloadData()
    
    }
    
    
    func filterContentForSearchText(searchText: String) {
                filterInfo = [Info]()
        
           var search = String(filter(searchText.lowercaseString.generate()) { $0 != " "})
        for id  in point.getOrderedKeys() {
            
            if id.lowercaseString.rangeOfString(search) != nil { // if searchText is anywhere in the id
                
                filterInfo.insert(point.getInfoDictionary()[id]!, atIndex: 0) // add that object to the fitlerInfo array
               
                
                println(id)
               
                
            }
           var i  = 0
            for info in filterInfo {
                println("in filter :   \(i)   :   \(info.getID()) ")
                i++
                
            }
           
        }
        
 
     
       
        
    }
    
    func searchDisplayController(controller: UISearchController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        
        self.filterContentForSearchText(searchString)
        return true
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
       
        if let cell = sender as? UITableViewCell {
           
            
            if segue.identifier == "toDetails"{
                let vc = segue.destinationViewController as! ViewDetails
                //vc.cell = indexPath.row
                if filterInfo.count == 0 { //normal table\
                    let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!

                    vc.currentCell = point.getInfoDictionary()[point.getOrderedSet()[indexPath.row] as! String]
                    println(vc.currentCell.getFirstname() + vc.currentCell.getLastname())
                    vc.delegate = self // switches to destination back to table view
                    
  
                    
                    
                } else { // search table
                     let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForCell(cell)
                vc.currentCell = filterInfo[indexPath!.row]
                println(vc.currentCell.getFirstname() + vc.currentCell.getLastname())
                vc.delegate = self // switches to destination back to table view
                
                }
            
            }
                
        } else { // in normal table
            
            let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow()!
            
            if segue.identifier == "toDetails"{
                let vc = segue.destinationViewController as! ViewDetails
                //vc.cell = indexPath.row
                vc.currentCell = point.getInfoDictionary()[point.getOrderedSet()[indexPath.row] as! String]
                println(vc.currentCell.getFirstname() + vc.currentCell.getLastname())
                vc.delegate = self // switches to destination back to table view
                //target.cell = put the array index of the person here
                
            }

            
        }
        
        
        
        
        }
    
}