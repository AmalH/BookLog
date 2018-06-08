//
//  ReadListViewController.swift
//  GoodreadsLog
//
//  Created by Amal on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var testBook = Book.init(title:"book 0", author: "author 0", coverSrc: "", status: "read")
    var booksArray = ["","",""]
    var selectedBook = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"shelfListItem")
        let bookCover = cell?.viewWithTag(0) as? UIImageView
        let bookTitle = cell?.viewWithTag(1) as? UILabel
        let bookAuthor = cell?.viewWithTag(2) as? UILabel
        let bookStatus = cell?.viewWithTag(3) as? UILabel
        
        bookAuthor?.text = booksArray[indexPath.row]
        bookTitle?.text = booksArray[indexPath.row]
        //testBook.authorName()
        // bookCover?.image = UIImage(named: moviesArray[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = booksArray[indexPath.row]
        //performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "toDetails"{
         if let destinationVC = segue.destination as? DetailViewController {
         destinationVC.movieName = selectedMovie
         }
         }*/
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        /* if editingStyle == .delete{
         moviesArray.remove(at: indexPath.row)
         tableView.reloadData()
         }*/
    }
    
    
}


