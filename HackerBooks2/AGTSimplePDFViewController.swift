//
//  AGTSimplePDFViewController.swift
//  HackerBooks2
//
//  Created by Izabela on 13/12/15.
//  Copyright © 2015 Izabela. All rights reserved.
//

import UIKit

class AGTSimplePDFViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var model : NSData?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadData(model!, MIMEType: "application/pdf", textEncodingName: "", baseURL: NSURL())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
