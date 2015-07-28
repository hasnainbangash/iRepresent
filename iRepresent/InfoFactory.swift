//
//  InfoFactory.swift
//  IVote2
//
//  Created by Hasnain Khan on 6/6/15.
//  Copyright (c) 2015 IVote2. All rights reserved.
//

import UIKit

class InfoFactory {

   private var infoDictionary = [String:Info]()
   private var newInfo : Info?
   private var idSet = Set<String>()
   private var idList = [String]()
    private var infoArray = [Info]()
    private var queryInfo  = [Info]()
    
    private var orderedKeys =  [String]() // to be used to get row data from indexpat
    private var orderedSet = NSOrderedSet(array: [String]())
    
  //  init(fname: String, lname: String, housein: String, dobin: String, districtin: String); -> Info {
  //    return  makeInfo(fname, lname: lname, housein: housein, dobin: dobin, districtin: districtin)
  //  }
static let sharedInstance = InfoFactory()
    
    func makeInfo(fname: String, lname: String, housein: String, dobin: String, districtin: Int?, gender: String, office : Int, term_start : String,
        term_end: String , title: String, party: String, suffix: String?, role: NSString?, state_name : String , state: String) -> Info  {
        
        var tempid = fname + lname + housein + dobin + state_name
        
        if let newInfo = infoDictionary[tempid] {
            //the object exists then
            return infoDictionary[tempid]!
        }
        
            newInfo = Info(fname: fname, lname: lname, housein: housein, dobin: dobin, districtin: districtin, gender: gender , office: office , term_start: term_start, term_end: term_end , title: title, party: party, suffix: suffix, role: role, state_name: state_name , state : state)
            
            
        infoDictionary.updateValue( newInfo!, forKey: newInfo!.getID())
        idSet.insert(newInfo!.getID())
        idList = Array(idSet)
        
            if !contains(orderedKeys, newInfo!.getID())
            {
                orderedKeys.append(newInfo!.getID())
                orderedSet = NSOrderedSet(array: orderedKeys)
                queryInfo.append(newInfo!)
            }
            
            
            infoArray.append(infoDictionary[tempid]!)
        return infoDictionary[tempid]!
    }
    
    func getIDlist() -> [String] {
        
        return idList
        
    }
    
    func getInfoDictionary() -> [String:Info] {
        
        return infoDictionary
        
    }
    
    
    func forCell(index: Int) -> Info {
        
            return infoDictionary[idList[index]]!
        
        
        
    }
    
    func getOrderedKeys() -> [String] {
        
 
        
        return orderedKeys
        
    }
    

    func getOrderedSet() -> NSOrderedSet {
        
        return orderedSet
        
    }
    
    
    func getQueryInfo() -> [Info] {
        
        
        
        return queryInfo
        
    }
    
    
    func emptyQueryInfo()  {
        
        
        queryInfo = [Info]()
        
        
    }
    
    
    
}