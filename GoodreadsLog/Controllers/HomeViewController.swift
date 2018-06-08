//
//  HomeViewController.swift
//  GoodreadsLog
//
//  Created by Amal on 6/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var shelfSelected = ""
    var readBooksArray = ["book 0","book 0","book 0"]
    var toReadBooksArray = ["book 1","book 1","book 1"]
    var readingBooksArray = ["book 2","book 2","book 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToList"{
            if self.shelfSelected == "read"{
                if let destinationVC = segue.destination as? ShelfViewController {
                    destinationVC.booksArray = readBooksArray
                }
            }
            if self.shelfSelected == "reading"{
                if let destinationVC = segue.destination as? ShelfViewController {
                    destinationVC.booksArray = readingBooksArray
                }
            }
            if self.shelfSelected == "toRead"{
                if let destinationVC = segue.destination as? ShelfViewController {
                    destinationVC.booksArray = toReadBooksArray
                }
            }
        }
    }
    
    @IBAction func readActionBtn(_ sender: Any) {
        self.shelfSelected = "read"
        self.performSegue(withIdentifier: "navigateToList", sender: self)
    }
    
    @IBAction func toReadBtnAction(_ sender: Any) {
        self.shelfSelected = "toRead"
        self.performSegue(withIdentifier: "navigateToList", sender: self)
    }
    
    @IBAction func readingBtnAction(_ sender: Any) {
        self.shelfSelected = "reading"
        self.performSegue(withIdentifier: "navigateToList", sender: self)
    }
    
}
