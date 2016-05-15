//
//  RemoteConnection.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 15/05/2016.
//  Copyright © 2016 Peter Mavridis. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class RemoteConnection:NSObject {
    
    
    let URL = "http://li859-75.members.linode.com/"
    let user = "pm554"
    
    private func dataTask(request: NSMutableURLRequest, method: String, completion: (success: Bool, data: AnyObject?) -> ()) {
        request.HTTPMethod = method
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
                completion(success: true, data: data)
            } else {
                completion(success: false, data: data)
            }
            }.resume()
    }
    
    private func clientURLRequest(path: String, parameter: Dictionary<String, String>? = nil) -> NSMutableURLRequest {
        
        let urlComponents = NSURLComponents(string: URL+path)!
        
        let url = urlComponents.URL!
        
        let request = NSMutableURLRequest(URL: url)
        
        if let parameter = parameter {
            var paramString = ""
            for (key, value) in parameter {
                let escapedKey = key.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
                let escapedValue = value.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())
                paramString += "\(escapedKey!)=\(escapedValue!)&"
            }
            print(paramString)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        }
        
        return request
    }
    
    private func post(request: NSMutableURLRequest, completion: (success: Bool, object: AnyObject?) -> ()) {
        dataTask(request, method: "POST", completion: completion)
    }
    
    private func get(request: NSMutableURLRequest, completion: (success: Bool, object: AnyObject?) -> ()) {
        dataTask(request, method: "GET", completion: completion)
    }
    
    func getHistory(completion: (success:Bool, data:[QuestionResponseModel]?) -> Void){
        let url = "retrieveAllEntries.php"
        
        get(clientURLRequest(url, parameter: nil)) { (success, data) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if success {
                    var history = [QuestionResponseModel]()
                    
                    let json = try? NSJSONSerialization.JSONObjectWithData(data as! NSData, options: [])
                    if let data = json as? NSMutableArray{
                        for result in data{
                            let question = result.valueForKey("question") as! String
                            let answer = result.valueForKey("answer") as! String
                            let image = result.valueForKey("imageURL") as! String
                            
                            history.append(QuestionResponseModel(question: question, answer: answer, image: image))
                            //}
                        }
                    }
                    completion(success: true, data: history)
                } else {
                    completion(success: false, data: nil)
                }
            })
        }
    }
    
    func addEntry(question:String, answer:String, completion: (success:Bool) -> Void){
        let parameter:Dictionary = [
            "username"	:	user,
            "question"	:	question,
            "answer"	:	answer
        ]
        
        let url = "addEntry.php"
        
        post(clientURLRequest(url, parameter: parameter)) { (success, data) -> () in
            let resultString:String = NSString(data: data as! NSData, encoding:NSUTF8StringEncoding)! as String
            print(resultString)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(success: success)
            })
        }
    }
}