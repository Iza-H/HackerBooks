//
//  AGTBook.swift
//  HackerBooks2
//
//  Created by Izabela on 12/12/15.
//  Copyright © 2015 Izabela. All rights reserved.
//

import UIKit

class AGTBook : Equatable{
    
    let title : String
    let authors : [String]
    var tags : [String]
    let image : NSData
    let pdf : NSData
    

    
    
    
    
    init(title : String,
        authors : [String],
        tags : [String],
        image: NSData,
        pdf : NSData){
            self.title = title
            self.authors = authors
            self.tags = tags
            self.image = image
            self.pdf = pdf
            
    }
    
    
   
    
}

func ==(lhs: AGTBook, rhs: AGTBook) -> Bool {
    return lhs.title.lowercaseString == rhs.title.lowercaseString
}

