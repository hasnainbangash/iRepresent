//
//  Call2.swift
//  IVote2
//
//  Created by Hasnain Khan on 6/7/15.
//  Copyright (c) 2015 IVote2. All rights reserved.
//

import UIKit


class Call2 {
    
    var api : String?
    var url : NSURL?
    var data : NSData?
    var key: String?
    var point = InfoFactory.sharedInstance
    
    init(search : String) {
        setAPI("https://congress.api.sunlightfoundation.com/legislators?per_page=all&query=")
        setKey("7d30eef3175c43f3a46c1eae920a38b0")
        setSearch(search)
        setNSURL()
        setNSDATA()
        deSerialize()
        
    }
    
    func setAPI(In: String) {
        
        self.api = In
        
        
    }
    
    func setSearch(search : String?)  {
        var searchTest : String
        if let searchTest = search  {
            
            api! += searchTest
            
            //attach our apikey and
            api! += "&apikey="
            api! += self.key!
            
            println(api);
            
        
        } else {
        
            api! += "&apikey="
            api! += self.key!
            
            println(api);

            
        }
        api = String(filter(api!.generate()) { $0 != " "})
      // api =   api!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        println(api);
    }
    
    
    func setKey(keyIn: String) {
        
        self.key = keyIn
        
        
    }
    
    func setNSURL() {
        
        self.url = NSURL(string: api!) //fetch a JSON response
 
        
        
    }
    
    func setNSDATA() {
        println(url);
        self.data = NSData(contentsOfURL: url!) //NSData class to load the raw response from the given URL into a new NSData object.
        
        
    }
    
    
    func deSerialize() {
    
    
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            
            
           for (key, value) in json {
            println("kind: \(key)")
            
            println("Value: \(value)")
            
            
                if let results: NSArray = json["results"] as? NSArray {
                    
                    println("in results")
          
                        println(results)
                    if results.count == 0 {
                        println("Empty ")
                        return
                    }
                    for i in 0...results.count-1 {
                    if let inner: NSDictionary = results[i] as? NSDictionary {
                       
                        
                        println(inner)
                        
                        println(inner["last_name"])
                         println(inner["first_name"])
                         println(inner["state_name"])
                        
                        point.makeInfo(inner["first_name"]! as! String,
                            lname: inner["last_name"]! as! String,
                            housein: inner["chamber"]! as! String,
                            dobin: inner["birthday"]! as! String,
                            districtin: inner["district"] as? Int,
                            gender: inner["gender"]! as! String ,
                            office: inner["in_office"]! as! Int ,
                            term_start: inner["term_start"]! as! String,
                            term_end: inner["term_end"]! as! String ,
                            title: inner["title"]! as! String,
                            party: inner["party"]! as! String,
                            suffix: inner["name_suffix"] as? String,
                            role:  (inner["leadership_role"]   as? NSString),
                            state_name: inner["state_name"]! as! String ,
                            state : inner["state"]! as! String)
                        
                        //let possibleName: String? = users["ballmer"]
                        //let steve: String? = users["sjobs"]

                    }
                    
                    }
            
//                     newInfo = Info(fname: fname, lname: lname, housein: housein, dobin: dobin, districtin: districtin, gender: gender , office: office , term_start: term_start, term_end: term_end , title: title, party: party, suffix: suffix, role: role, state_name: state_name , state : state)

                
            }
            }
           
            
        }
    
    
    }
    
}