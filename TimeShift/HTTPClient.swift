//
//  HTTPClient.swift
//  TimeShift
//
//  Created by Vision Mkhabela on 4/22/17.
//  Copyright © 2017 Bitwaregon. All rights reserved.
//

import Foundation

class HTTPClient : NSObject{

    var url : String = "http://softwaregon-candella.rhcloud.com/rest/"
    var request : NSMutableURLRequest = NSMutableURLRequest()
    private var persistencyManager = PersistencyManager()
    
    func authenticateUser(method:String,params:String){
        
        let url = String(self.url+method+params)
        request.httpMethod = "GET"
        var userDictionary = [String: AnyObject]()
        var viewModel = UsserViewModel(usser:Usser(userName:"", passWord: "", loginStatus: ""))
        
        DispatchQueue.main.async {
        let task = URLSession.shared.dataTask(with: URL(string:url!)!) { data, response, error in
           
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            do {
                userDictionary = try JSONSerialization.jsonObject(with: data) as! [String: AnyObject]
                print(userDictionary)
                
                if (userDictionary["response"] as? String == "success") {
                 viewModel =  UsserViewModel(usser: Usser(userName: (userDictionary["usrname"] as? String)!, passWord: (userDictionary["password"] as? String)!,loginStatus: (userDictionary["response"] as? String)!))
                    LibraryAPI.sharedInstance.setUserViewModel(userViewModel:viewModel)
                    
                }else{
                
                }
       
            } catch {
                print("json error: \(error.localizedDescription)")
            }
            //)
        }
        task.resume()
        }
        
    }
}
