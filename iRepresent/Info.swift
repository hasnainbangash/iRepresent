//
//  Info.swift
//  IVote2
//
//  Created by Hasnain Khan on 6/6/15.
//  Copyright (c) 2015 IVote2. All rights reserved.
//

import UIKit

class Info {
    
private var firstname: String?
private var lastname: String?
private var id: String?

    
private var house : String? //chamber
private var dob: String?
private var district: Int?
    
private var gender: String?
private var inoffice: Bool?
private var suffix: String?
private var party: String?
private var state: String?
private var statename: String?
private var endterm: String?
private var startterm: String?
private var title: String?
private var role: String?


private var committees = [String]()
private var bills = [String]()

    init(fname: String, lname: String, housein: String, dobin: String, districtin: Int?, gender: String, office : Int, term_start : String,
        term_end: String , title: String, party: String, suffix: String?, role: NSString? , state_name : String , state: String) {
    setFirstname(fname)
    setLastname(lname)
    setHouse(housein)
    setDob(dobin)
    setDistrict(districtin)
    setStateName(state_name)
    setGender(gender)
    setOffice(office)
    setStartTerm(term_start)
    setEndTerm(term_end)
    setTitle(title)
    setParty(party)
    setSuffix(suffix)
    setState(state)
    setRole(role)
    setID()
}

    
    func setFirstname(fname: String?)  {
        if let firstname = fname   {
            self.firstname = fname
        }
        
        else    {
            
            println("Name cannot be nil")
        
        }
    
    }
    
    func setLastname(lname: String?)  {
        
        if let lastname = lname  {
        self.lastname = lname
        
        } else {
        
            println("Name cannot be nil")
    
        }
   
    }
    
    
    func setHouse(housein: String?)  {
        
        if let  house = housein  {
            self.house = housein
            
        } else {
            
            println("House cannot be nil")
            
        }
        
    }
    
    func setDob(dobin: String?)  {
        
        if let  dob = dobin {
            self.dob = dobin
            
        } else {
            
            println("Date of Birth cannot be nil")
            
        }
        
    }
    
    func setDistrict(districtin: Int?)  {
        
        if let  district = districtin {
            self.district = districtin
            
        } else {
            
            println("Distritct cannot be nil")
            
        }
        
    }
    
    func setID()  {
        
        self.id = getFirstname() + getLastname() + getHouse() + getDob() + getStateName()
        
    }
    
    
    func setGender(genin: String?)  {
        
        if let gender = genin  {
            self.gender = genin
            
        } else {
            
            println("Gender  cannot be nil")
            
        }
        
    }
    
    func setOffice(offin: Int?)  {
        
        if let  inoffice = offin  {
            if offin == 1 {
                self.inoffice = true}
            else{
                self.inoffice = false;}
            
        } else {
            
            println("Office Status cannot be nil")
            
        }
        
    }
    
    func setSuffix(sufin: AnyObject?)  {
        
        if let suffix: AnyObject = sufin {
            self.suffix = sufin as? String
        } else {
            
            println("Suffix cannot be nil")
            
        }
        
    }
    
    func setParty(pin: String?)  {
        
        if let party = pin {
            self.party = pin
        } else {
            
            println("Party Name cannot be nil")
            
        }
        
    }
    
    
    func setState(sin: String?)  {
        
        if let  state = sin {
            self.state  = sin
        } else {
            
            println("State cannot be nil")
            
        }
        
    }
    
    func setStateName(statein: String?)  {
        
        if let  statename  = statein {
            self.statename  = statein
        } else {
            
            println("State Full Name cannot be nil")
            
        }
        
    }
    
    func setEndTerm(etin: String?)  {
        
        if let  endterm = etin  {
            self.endterm  = etin
        } else {
            
            println("End Term cannot be nil")
            
        }
        
    }
    
    
    func setStartTerm(startin: String?)  {
        
        if let  startterm = startin {
            self.startterm  = startin
        } else {
            
            println("Start Term cannot be nil")
            
        }
        
    }
    
    
    func setTitle(titlein: String?)  {
        
        if let   title = titlein {
            self.title  = titlein
        } else {
            
            println("Title cannot be nil")
            
        }
        
    }
    
  
    func setRole(rolein: NSObject?)  {
        
        if let   role = rolein {
            self.role = rolein as? String
        } else {
            
            println("Title cannot be nil")
            
        }
        
    }
    
    
    
    func addToCommittee(commin: String?)  {
        var comm: String!
        if let comm  = commin {
            committees.append(commin!)
        
        } else {
            
            println("Committee cannot be nil")
            
        }
        
    }
    
    func addBills(billin: String?)  {
        
        var bill: String!
        if let  bill = billin{
            bills.append(billin!)
            
        } else {
            
            println("Bill cannot be nil")
            
        }
        
        
    
    }


    
    
    func getCommittee() -> [String]  {
        return self.committees
    }
    
    func getBills()  -> [String] {
        
      return self.bills
        
        
        
    }
    
    func getFirstname()  ->String {
        
       return firstname!
        
        
    }
    
    func getLastname()  ->String {
        
        return lastname!
        
        
    }

    
    func getHouse() -> String  {
        
     return house!
        
    }
    
    func getDob() -> String  {
        
       return dob!
    }
    
    func getDistrict()  -> Int {
        if(self.district != nil){
            return district!
        }else{
            return 0;
        }
    }
    
    func getID()  -> String {
        
        return id!
    }
    
    
    
    
    func getGender() -> String  {
        
       return self.gender!
        
        
    }
    
    func getOffice( ) -> Bool {
        
        return self.inoffice!
        
        
    }
    
    func getSuffix() -> String  {
        if self.suffix != nil{
            return self.suffix!
        }
        else{
            return "";
        }
        
    }
    
    func getParty() -> String  {
        
      return self.party!
    }
    
    
    func getState() -> String {
        return self.state!
    }
    
    func getStateName() -> String {
        
       return self.statename!
    }
    
    func setEndTerm() -> String{
        return self.endterm!
        
    }
    
    
    func getStartTerm() -> String  {
        
        return self.startterm!
    }
    
    
    func getTitle() -> String  {
         return self.title!
    }
    
    
    func getRole() -> String  {
        return self.role!
    }
    
    
    
    
    
    
}





    


    
    
