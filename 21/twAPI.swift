//
//  twAPI.swift
//  21
//
//  Created by Ilyes HERMELLIN on 11/09/15.
//  Copyright (c) 2015 Ilyes HERMELLIN. All rights reserved.
//

import MobileCoreServices

class twAPI {
    
    static let host: NSString = "http://localhost:3000/"
    
    static let sessionUrl = host.stringByAppendingPathComponent("/session")
    static let loginUrl = host.stringByAppendingPathComponent("/login")
    
    static let searchUrl = host.stringByAppendingPathComponent("/search")
    
    static let indexUrl = host.stringByAppendingPathComponent("/posts")
    static let addUrl = host.stringByAppendingPathComponent("/posts")
    
    static func session(completion: ((NSData?, NSURLResponse?, NSError?) -> ())?) {
        createRequest(sessionUrl, method: "GET", completion: completion)
    }
    
    static func login(username: String, password: String, completion: ((NSData?, NSURLResponse?, NSError?) -> ())?) {
        
        let str = NSString(string: username + ":" + password)
        let data = str.dataUsingEncoding(NSUTF8StringEncoding)!
        createRequest(loginUrl, method: "GET", headers: ["Authorization": "Basic " + data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())], completion: completion)
    }
    
    static func search(query: String, completion: (JSON?, NSError!) -> Void) -> NSURLSessionDataTask {
        let url = searchUrl + "?q=" + query.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())!
        
        return createRequest(url, method: "GET", completion: {
            data, response, error in
            
            if error != nil {
                completion(nil, error);
                return
            }
            completion(JSON(data: data!), error)
        })
    }
    
    static func index(completion: (JSON?, NSError!) -> Void) {

        createRequest(indexUrl, method: "GET") {
            data, response, error in
            
            if error != nil {
                completion(nil, error);
                return
            }
            completion(JSON(data: data!), error)
        }
    }
    
    static func add(image: UIImage) {

        let imageData = UIImagePNGRepresentation(image)
        
//        let task = createRequest(addUrl, method: "POST", body: ["title": "lol"], files: ["image": imageData]) {
//            data, response, error in
//            
//            if error != nil {
//                print("Error: \(error)")
//                return
//            }
//            
//            print(response)
//        }
    }
    
    static func createRequest(url: String, method: String, body: [String: String]? = nil, files: [String: NSData]? = nil, headers: [String: String]? = nil, completion: ((NSData?, NSURLResponse?, NSError?) -> ())?) -> NSURLSessionDataTask {
        let boundary = generateBoundaryString()
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = method
        
        if let headers = headers {
            for (header, value) in headers {
                request.addValue(value, forHTTPHeaderField: header)
            }
        }
            
        if method == "POST" {
            if (files != nil) {
                request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            }
            request.HTTPBody = createBodyWithParameters(body, files: files, boundary: boundary)
        }
        
        var task: NSURLSessionDataTask!
        
        if let completionS = completion {
            task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: completionS);
        } else {
            task = NSURLSession.sharedSession().dataTaskWithRequest(request);
        }
        task.resume()
        return task
    }
    
    static func createBodyWithParameters(parameters: [String: String]?, files: [String: NSData]?, boundary: String) -> NSData {
        let body = NSMutableData()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        if files != nil {
            for (key, file) in files! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"; filename=\"image.png\"\r\n")
                body.appendString("Content-Type: image/png\r\n\r\n")
                body.appendData(file)
                body.appendString("\r\n")
            }
        }
        
        body.appendString("--\(boundary)--\r\n")
        return body
    }

    static func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
}


extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
}










