//
//  Book.swift
//  GoodreadsLog
//
//  Created by Amal on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//



class Book {
    
    var title: String
    var author: String
    var coverSrc: String
    var status: String
    
    func authorName() -> String {
        return author
    }
    
    func bookTitle() -> String {
        return title
    }
    
    init(title: String, author: String, coverSrc: String, status:String) {
        self.title = title
        self.author = author
        self.coverSrc = coverSrc
        self.status = status
    }
}
