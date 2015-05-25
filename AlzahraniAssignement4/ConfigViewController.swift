//
//  ConfigViewController.swift
//  AlzahraniAssignement4
//
//  Created by Abdulrahman on 2015-05-17.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit


class ConfigViewController: UIViewController {
    @IBOutlet weak var Favsegment: UISegmentedControl!
    @IBOutlet weak var ChLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    @IBOutlet weak var Chlabletxt: UITextField!
    static var Channel_1_NO : Int? = 1
    static var Channel_1_title : String? = "ABC"
    
    static var Channel_2_NO : Int? = 2
    static var Channel_2_title : String? = "CNN"
    
    static var Channel_3_NO : Int? = 3
    static var Channel_3_title : String? = "HBO"
    
    static var Channel_4_NO : Int? = 4
    static var Channel_4_title : String? = "FOX"
   
     var channelInputText :String?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        stepper.wraps = false
        stepper.autorepeat = false
        stepper.maximumValue = 99
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperChanged(sender: AnyObject) {
        ChLabel.text = Int(stepper.value).description
    }
    @IBAction func FavouriteChanged(sender: AnyObject) {


        var ComingVal = Favsegment.selectedSegmentIndex
        if ComingVal == SharedData.sharedInstance.channelsConfiguration[0].customNumber{
            
           
            Chlabletxt.text = ConfigViewController.Channel_1_title!
            ChLabel.text = ConfigViewController.Channel_1_NO?.description
          
        }
        else if ComingVal == SharedData.sharedInstance.channelsConfiguration[1].customNumber{
            ChLabel.text = SharedData.sharedInstance.channelsConfiguration[1].customNumber?.description
            
             Chlabletxt.text = SharedData.sharedInstance.channelsConfiguration[1].channelLable
            
            Chlabletxt.text = ConfigViewController.Channel_2_title!
            ChLabel.text = ConfigViewController.Channel_2_NO?.description
        }
        else  if ComingVal == SharedData.sharedInstance.channelsConfiguration[2].customNumber{
            ChLabel.text = SharedData.sharedInstance.channelsConfiguration[2].customNumber?.description
            
             Chlabletxt.text =  SharedData.sharedInstance.channelsConfiguration[2].channelLable
            
            Chlabletxt.text = ConfigViewController.Channel_3_title!
            ChLabel.text = ConfigViewController.Channel_3_NO?.description
        }
        else  if ComingVal == SharedData.sharedInstance.channelsConfiguration[3].customNumber{
            ChLabel.text = SharedData.sharedInstance.channelsConfiguration[3].customNumber?.description
            
             Chlabletxt.text = SharedData.sharedInstance.channelsConfiguration[3].channelLable
         
            Chlabletxt.text = ConfigViewController.Channel_4_title!
            ChLabel.text = ConfigViewController.Channel_4_NO?.description
        }
    }
    
    @IBAction func SomeValChanged(sender: AnyObject) {
        
        
        let Theshorthand : String = Chlabletxt.text!
        if count(Theshorthand) > 4
        {
           popupMessage()
        }
        else {
        if Favsegment.selectedSegmentIndex == 0
        {
           channelInputText = Chlabletxt.text
     
            Favsegment.setTitle(channelInputText!, forSegmentAtIndex: 0)
            ConfigViewController.Channel_1_title = Chlabletxt.text
            ConfigViewController.Channel_1_NO = ChLabel.text!.toInt()!
        }
        
        else if Favsegment.selectedSegmentIndex == 1
        {
            channelInputText = Chlabletxt.text
            Favsegment.setTitle(channelInputText!, forSegmentAtIndex: 1)
            ConfigViewController.Channel_2_title = Chlabletxt.text
            ConfigViewController.Channel_2_NO = ChLabel.text!.toInt()!
        }
        
        else if Favsegment.selectedSegmentIndex == 2
        {
            channelInputText = Chlabletxt.text
 
            Favsegment.setTitle(channelInputText!, forSegmentAtIndex: 2)
            ConfigViewController.Channel_3_title = Chlabletxt.text
           ConfigViewController.Channel_3_NO = ChLabel.text!.toInt()!
        }
        
        else if Favsegment.selectedSegmentIndex == 3
        {
            channelInputText = Chlabletxt.text

            Favsegment.setTitle(channelInputText!, forSegmentAtIndex: 3)
            ConfigViewController.Channel_4_title = Chlabletxt.text
            ConfigViewController.Channel_4_NO = ChLabel.text!.toInt()!
        }
   
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popupMessage()
    {
        var ConfirmAlert = UIAlertController(title: "Warning", message: "The size of the label should not be more than 4 Characters", preferredStyle: UIAlertControllerStyle.Alert)
        
        
       
        
        
        
        ConfirmAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            
        
        //    self.presentViewController(ConfirmedChangeAlert, animated: true, completion: nil)
            
        }))
        
       
        
       
        
        presentViewController(ConfirmAlert, animated: true, completion: nil)
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
