//
//  TableViewController.swift
//  HackerBooks2
//
//  Created by Izabela on 12/12/15.
//  Copyright © 2015 Izabela. All rights reserved.
//

import UIKit

class AGTLibraryTableViewController: UITableViewController, AGTLibraryDelegate{
    
    var model : AGTLibrary?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let strFilePath = documents.stringByAppendingString("books_readable.json");
        do {
            guard let _ = defaults.valueForKey("hackerReaderUsed") else {
                defaults.setBool(true, forKey: "hackerReaderUsed")
                let urlString = "https://t.co/K9ziV0z3SJ"
                
                if let urlJSON = NSURL(string: urlString), let data = NSData(contentsOfURL: urlJSON){
                    data.writeToFile(strFilePath, atomically: true)
                    try createModel(data);
                }
                return
            }
            if let data = NSData(contentsOfFile: strFilePath){
                try createModel(data)
            }
            
        } catch {
            fatalError()
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (model?.countTags)!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model?.sortedTagsList[section].capitalizedString
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (model?.countBooksForSection(section))!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> AGTBookTableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("AGTBookTableViewCell") as! AGTBookTableViewCell
        

        
        let book = model?.getBook(indexPath.section, index: indexPath.row)
        cell.titleLabel.text = book?.title
        cell.subTitleLabel.text = book?.authors.joinWithSeparator(", ")
        

        return cell
        

    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // performSegueWithIdentifier("showBook", sender: self)
    }

   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createModel(data: NSData) throws{
        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONArray {
            
            model = AGTLibrary(collection: decode (booksCollection: json))
            print(model)
            
        }
    }
    
    
    //MARK: --Seques
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBook"{
            let bookVC = segue.destinationViewController as? AGTBookViewController
            let ip = self.tableView.indexPathForSelectedRow
            let book = model?.getBook((ip?.section)!, index: (ip?.row)!)
            bookVC?.delegate = self
            bookVC?.model = book
           /* if let indexPath = self.tableView.indexPathForSelectedRow {
                let book = model!.getBook((indexPath.section), index: (indexPath.row))
                let controler = (segue.destinationViewController as! UINavigationController).topViewController as! AGTBookViewController
                controler.model = book
                 }*/
                //controler.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                //controler.navigationItem.leftItemsSupplementBackButton = true
          //  }
            
        
        
        }
            
            
    }
    
    
    
    
    func modifiedFavouriteValue(value: Bool, book: AGTBook, controller: AGTBookViewController){
        self.model?.setFavourite(value, book: book);
        self.tableView?.reloadData()
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    



}
protocol AGTLibraryDelegate
{
    func modifiedFavouriteValue(value: Bool, book: AGTBook, controller: AGTBookViewController)
}








