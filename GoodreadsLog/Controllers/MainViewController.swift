//
//  ViewController.swift
//  GoodreadsOauth
//
//  Created by Amal on 5/23/18.
//  Copyright © 2018 Amal. All rights reserved.
//

import UIKit
import OAuthSwift
import SafariServices
import SWXMLHash
import Alamofire

class MainViewController:OAuthViewController {
    
    // oauth
    var oauthswift: OAuthSwift?
    // api calls
    let adduser_apiurl = "http://localhost:8888/gdRdsLog/adduser.php"
    
    // login btn
    @IBAction func goodReadsAuthActiob(_ sender: Any) {
        
        /** create an instance of oauth1 **/
        let oauthswift = OAuth1Swift(
            consumerKey:        "DoCJiny85pQMBpNxiWUEg",
            consumerSecret:     "iRSv76VCZekmBIf8lAx6FMccL6vJkiU8SV5j8BaXE",
            requestTokenUrl:    "https://www.goodreads.com/oauth/request_token",
            authorizeUrl:       "https://www.goodreads.com/oauth/authorize?mobile=1",
            accessTokenUrl:     "https://www.goodreads.com/oauth/access_token"
        )
        self.oauthswift=oauthswift
        oauthswift.allowMissingOAuthVerifier = true
        oauthswift.authorizeURLHandler = getURLHandler()
        
        /** authorize **/
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "Goodreadslog://oauth-callback/goodreads")!,
            success: { credential, response, parameters in
                self.performSegue(withIdentifier: "navigateToHome", sender: self)
                self.saveUserID(oauthswift)
        },
            failure: { error in
                print( "ERROR ERROR: \(error.localizedDescription)", terminator: "")
        }
        )
    }

    func saveUserID(_ oauthswift: OAuth1Swift) {
        let _ = oauthswift.client.get(
            "https://www.goodreads.com/api/auth_user",
            success: { response in
                
                /** parse the returned xml to read user id **/
                let dataString = response.string!
                let xml = SWXMLHash.parse(dataString)
                let userID  =  (xml["GoodreadsResponse"]["user"].element?.attribute(by: "id")?.text)!
                print("---- XML:\(userID)")
                print("---- USER ID:\(userID)")
               
                /** save the userID to mysql database **/
                self.addUser(id: userID, username: "itsme")
                
        }, failure: { error in
            print(error)
        }
        )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    
    
    /*----------------- UTILS ------------------*/
    
    /*func showAlertView(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }*/
    
    func getURLHandler() -> OAuthSwiftURLHandlerType {
        if #available(iOS 9.0, *) {
            let handler = SafariURLHandler(viewController: self, oauthSwift: self.oauthswift!)
           /* handler.presentCompletion = {
                print("Safari presented")
            }
            handler.dismissCompletion = {
                print("Safari dismissed")
            }*/
            handler.factory = { url in
                let controller = SFSafariViewController(url: url)
                // Customize it, for instance
                if #available(iOS 10.0, *) {
                    // controller.preferredBarTintColor = UIColor.red
                }
                return controller
            }
            
            return handler
        }
        return OAuthSwiftOpenURLExternally.sharedInstance
    }
    
    
    func addUser(id: String, username: String){
        
        let parameters: Parameters=[
         "id":id,
         "username":username
         ]
         
         Alamofire.request(adduser_apiurl, method: .get, parameters: parameters).responseJSON
         {
         response  in
         print("JSON:\(response.value)")
         // getting the json value from the serverllo
         if let result = response.result.value
         {
         let jsonData = result as! NSDictionary
         print(jsonData)
         
         let val = jsonData.value(forKey: "value") as! Int64
         print(val)
         
         if(val==0){
         print("failure")
         }
         else if(val==1){
         print("succes")
         }
         }
         }
        
        
    }
    
    
}


