//
//  AGTBookViewController.swift
//  HackerBooks2
//
//  Created by Izabela on 13/12/15.
//  Copyright © 2015 Izabela. All rights reserved.
//

import UIKit

class AGTBookViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    @IBOutlet weak var switchElement: UISwitch!
    
    @IBOutlet weak var image: UIImageView!
    
    var delegate : AGTLibraryDelegate? = nil
    
   
    
   var model : AGTBook?

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = model?.title
        authorsLabel.text = model?.authors.joinWithSeparator(", ")
        
        if let _ = model?.image{
            if let img = UIImage(data: (model?.image)!){
                image.image = img
            }
        }

       
        
        
        
        let index = model?.tags.indexOf("Favourite")
        if (index >= 0){
            model?.tags.removeAtIndex(index!)
            switchElement.setOn(true, animated: true)
        } else{
            switchElement.setOn(false, animated: true)
        }
         tagsLabel.text = model?.tags.joinWithSeparator(", ")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func switchChange(sender: AnyObject) {
            var isFavourite :Bool
            if switchElement.on {
                switchElement.setOn(true, animated:true)
                model?.tags.insert("Favourite", atIndex: 0)
                isFavourite=true;
            } else {
                switchElement.setOn(false, animated:true)
                model?.tags.removeAtIndex(0)
                isFavourite=false
            }
            delegate!.modifiedFavouriteValue(isFavourite, book: model!, controller:self)
    }

    
    
    //MARK: - Seques
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPDF"{
            let pdfVC = segue.destinationViewController as? AGTSimplePDFViewController
            pdfVC?.model = model?.pdf
      
        }
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}





