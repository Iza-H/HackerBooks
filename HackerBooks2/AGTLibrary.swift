//
//  AGTLibrary.swift
//  HackerBooks2
//
//  Created by Izabela on 11/12/15.
//  Copyright © 2015 Izabela. All rights reserved.
//

import UIKit


class AGTLibrary {
    
    
    //MARK: - Properties
    var tags : [String : Array<AGTBook>]
    let favouriteTag : String  = "Favourite"
    
    
    var countTags : Int {
        get {
            return tags.count
        }
    }
    
    var tagsList : [String]{
        get {
            return Array(tags.keys)
        }
    }
    
    
    var sortedTagsList : [String]{
        get {
            var sortedKeys : Array<String> = tags.keys.sort()
            if let index = sortedKeys.indexOf(favouriteTag){
                sortedKeys.removeAtIndex(index);
                sortedKeys.insert(favouriteTag, atIndex: 0)
            }
            return sortedKeys;
            
        }
    }
    
    
    init(tags : [String : Array<AGTBook>]){
        self.tags = tags
    }
    
    init(collection books: Array<AGTBook>){
        self.tags = [:]
        for book in books{
            let tags = book.tags
            for tag in tags {
                if var value=self.tags[tag] {
                    for (index, v) in value.enumerate() {
                        if (!value.contains(book) && book.title<v.title){
                            value.insert(book, atIndex:index)
                        }
                    }
                    if (!value.contains(book)){
                        value.insert(book, atIndex:value.count)
                    }
                    self.tags[tag]=value;
                }else {
                     self.tags[tag]=[book]
                }
            }
        }
    }
    
    func setFavourite(isFavourite: Bool, book: AGTBook){
        let defaults = NSUserDefaults.standardUserDefaults()
        if isFavourite==true{
            defaults.setBool(true, forKey: book.title)

            if var value=self.tags[favouriteTag] {
                for (index, v) in value.enumerate() {
                    if (!value.contains(book) && book.title<v.title){
                        value.insert(book, atIndex:index)
                    }
                }
                if (!value.contains(book)){
                    value.insert(book, atIndex:value.count)
                }
                self.tags[favouriteTag]=value;
            }else {
                self.tags[favouriteTag]=[book]
            }
        }else{
            defaults.removeObjectForKey(book.title)
            if let index = self.tags[favouriteTag]?.indexOf(book){
                self.tags[favouriteTag]?.removeAtIndex(index)
            }
            if self.tags[favouriteTag]?.count==0 {
                self.tags.removeValueForKey(favouriteTag);
            }
        }
        
    }
    
    func getBook(section : Int , index idx : Int) -> AGTBook{
        let nameTag = self.sortedTagsList[section]
        let values = tags[nameTag]
        return (values?[idx])!
 }
    
    
    func countBooksForTag(tag : String) -> Int {
        var count : Int = 0
        if tags.keys.contains(tag){
            let values = tags[tag]
            count = (values?.count)!
        }
        return count;
    }
    
    
    func countBooksForSection(section : Int) -> Int{
        let sectionName = sortedTagsList[section]
        return countBooksForTag(sectionName)
    }
    


    
    
    
    
}
