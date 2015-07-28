//
//  viewDetails.swift
//  IVote2
//
//  Created by Hasnain Khan on 6/7/15.
//  Copyright (c) 2015 IVote2. All rights reserved.
//

import UIKit

protocol viewDetailsDelegate{
    func iFinish(controller:ViewDetails, text:String)
}

class ViewDetails: UIViewController { //TO DOS: link the cell data so it grabs the right person, set working constrains on the back button and scroll view so that the scroll view doesn't block the back button, get picture data, and find the best way to display bills, and committees
    
    var point = InfoFactory.sharedInstance
    var delegate:viewDetailsDelegate? = nil
    var cell : Int! //fill this in whenever we click on a cell
    var currentCell: Info! // this is the current person
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBAction func goBack(sender: AnyObject) {
        
        if (delegate != nil) {
            delegate!.iFinish(self, text: "I AM BACK")
            println("You selected cellYOLO")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadScrollView();
    }
    
    func loadScrollView(){
        //add the full name
        var name : UILabel = UILabel();
        name.text = currentCell.getTitle() + " " + currentCell.getFirstname() + " " + currentCell.getLastname() + " " + currentCell.getSuffix();
        name.frame = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: 200, height: 20))
        scroller.addSubview(name);
        
        //Put misc details DoB, gender, and party
        var gender : String = "";
        if(currentCell.getGender() == "M"){
            gender = "Male"
        }else{
            gender = "Female"
        }
        
        var party = ""
        if(currentCell.getParty() == "R"){
            party = "Republican"
        }else if(currentCell.getParty() == "D"){
            party = "Democrat"
        }else{
            party = "Independant"
        }
        var misc : UILabel = UILabel();
        misc.text = currentCell.getDob() + "\n" + gender + "\n" + party;
        misc.numberOfLines = 3;
        misc.frame = CGRect(origin: CGPoint(x: 0.0, y: 20.0), size: CGSize(width: 200, height: 100))
        scroller.addSubview(misc)
        
        //Put in State, District, House, StartTerm
        var state : UILabel = UILabel();
        
        if currentCell.getHouse() == "house"{
            state.text = "From: " + currentCell.getStateName() + "\nDistrict Number: " + (currentCell.getDistrict().description) }
        else {state.text = "From: " + currentCell.getStateName() }
        
        state.frame = CGRect(origin: CGPoint(x: 0.0, y: 120.0), size: CGSize(width: 200, height: 100))
        state.numberOfLines = 3;
        scroller.addSubview(state);
            
        var chamber: UILabel = UILabel()
        chamber.text = "Chamber: " + currentCell.getHouse().capitalizedString + "\nStarted Term: " + currentCell.getStartTerm()
        chamber.frame = CGRect(origin: CGPoint(x: 0.0, y: 220.0), size: CGSize(width: 200, height: 20))
        scroller.addSubview(chamber)
        
        //Put in if currently in office
        var inOffice : UILabel = UILabel();
        if currentCell.getOffice(){
            inOffice.text = "Currently in Office"
        }else{
            inOffice.text = "No Longer in Office"
        }
        inOffice.frame = CGRect(origin: CGPoint(x: 0.0, y: 250.0), size: CGSize(width: 200, height: 20))
        scroller.addSubview(inOffice)
        
     
        
        
        
        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scroller.addGestureRecognizer(doubleTapRecognizer)
        
        let scrollViewFrame = scroller.frame
        let scaleWidth = scrollViewFrame.size.width / scroller.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scroller.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        scroller.minimumZoomScale = minScale;
        
        scroller.maximumZoomScale = 1.0
        scroller.zoomScale = minScale;
    }
    
    
}