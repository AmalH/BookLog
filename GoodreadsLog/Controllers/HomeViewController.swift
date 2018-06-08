//
//  HomeViewController.swift
//  GoodreadsLog
//
//  Created by Amal on 6/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func readActionBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "navigateToList", sender: self)
    }
    
    @IBAction func toReadBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "navigateToList", sender: self)
    }
    
    @IBAction func readingBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "navigateToList", sender: self)
    }

}
