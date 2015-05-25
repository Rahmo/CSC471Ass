//
//  ViewController.swift
//  AlzahraniAssignement4
//
//  Created by Abdulrahman on 2015-04-23.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtPower: UILabel!
    @IBOutlet var PowerSwitcher: UISwitch!
    @IBOutlet weak var Vollbl: UILabel!
    @IBOutlet weak var VolSlider: UISlider!
    @IBOutlet var lblChannels: UILabel!
    @IBOutlet weak var ABCbtn: UIButton!
    @IBOutlet weak var FOX: UIButton!
    @IBOutlet weak var HBO: UIButton!
    @IBOutlet weak var CNN: UIButton!

    @IBOutlet weak var favBar: UISegmentedControl!
    
    var IsTyped = false
    var Chspace = 0
    @IBOutlet weak var TopVeiw: UIView!
    @IBOutlet weak var MiddleView: UIView!
    @IBOutlet weak var BottomView: UIView!
    
    @IBOutlet weak var FavSegments: UISegmentedControl!

    override func viewDidLoad() {
          super.viewDidLoad()
        var segmented:UISegmentedControl!

          TopVeiw.backgroundColor =  UIColor.redColor().colorWithAlphaComponent(0.1)
        VolSlider.value = 0.0
        BottomView.userInteractionEnabled = false
        Vollbl.text = "\(Int(VolSlider.value))"
      lblChannels.text = " "
        
    }
        func userDidsomething(info: String){
            lblChannels.text = info
            
          //  let v = segue.destinationViewController as! ConfigViewController
    
        }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated);
        favBar.setTitle(ConfigViewController.Channel_1_title, forSegmentAtIndex: 0)
        favBar.setTitle(ConfigViewController.Channel_2_title, forSegmentAtIndex: 1)
        favBar.setTitle(ConfigViewController.Channel_3_title, forSegmentAtIndex: 2)
        favBar.setTitle(ConfigViewController.Channel_4_title, forSegmentAtIndex: 3)
     //    self.navigationController(Concontroller, animated: true)
        
    }
    @IBAction func SwitcherClicked(sender: AnyObject!) {
        if PowerSwitcher.on == true
        {
        txtPower.text = "On"
            TopVeiw.backgroundColor =  UIColor.greenColor().colorWithAlphaComponent(0.1)
            BottomView.userInteractionEnabled = true
//            if (self.tabBarController.viewControllers[1] != nil)
//            {
//            
//            }
//             FavSegments.setValue(8, forKey: "HBO")
        }
        else {
         txtPower.text = "Off"
           TopVeiw.backgroundColor =  UIColor.redColor().colorWithAlphaComponent(0.1)
            BottomView.userInteractionEnabled = false
        }
    }
    
    @IBAction func VolChanged(sender: UISlider) {
        var cur = sender.value
         Vollbl.text = "\(Int(cur))"
        
    }
 
    @IBAction func ChannelChanged(sender: UIButton) {
       
        var Valuet = sender.currentTitle!.toInt()!
        if Chspace == 2 {
            let alertController = UIAlertController(title: "Itv", message:
                "Number of Channels should be no more than 99", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
            lblChannels.text = " "

            Chspace = 0
        }
        else
        {
            if IsTyped {
                
                lblChannels.text = lblChannels.text! + "\( Valuet  )"
                Chspace = Chspace + 1
            } else {
                  lblChannels.text = " "
                lblChannels.text = "\( Valuet  )"
                IsTyped = true
                Chspace = 1
            }
        }
        
       
    }
    
    
    @IBAction func ChannelUpDown(sender: UIButton!) {
       
        

        var ComingVal = sender.currentTitle!
     
       var currentCh = lblChannels.text!
      
        if ComingVal == "Ch+"
        {
            if currentCh == " "
            {
                lblChannels.text = "0"
            }
            else {
        lblChannels.text = "\( CurrentChannelCheck(currentCh.toInt()! + 1))"}
        }
        else {
            
            if currentCh == " "
            {
                lblChannels.text = "0"
            }
            else {
         lblChannels.text = "\( CurrentChannelCheck(currentCh.toInt()! - 1))"
            }
        }
   
        
    }

    func CurrentChannelCheck(Num: Int) -> Int {
        if Num <= 0
        {
            return 0
        }
        else if Num >= 99
        {
            return 99
        }
      return Int(Num)
    }
    
  
    @IBAction func FavoPressed(sender: AnyObject) {
      
 
        var ComingVal = FavSegments.selectedSegmentIndex
        
        if ComingVal == 0 {
            lblChannels.text = "\(ConfigViewController.Channel_1_NO!)"
        }
        else if ComingVal == 1 {
            lblChannels.text = "\(ConfigViewController.Channel_2_NO!)"
        }
        else  if ComingVal == 2{
            lblChannels.text = "\(ConfigViewController.Channel_3_NO!)"
        }
        else  if ComingVal == 3 {
            lblChannels.text = "\(ConfigViewController.Channel_4_NO!)"
            
        }

    
    }
    @IBAction func FavPressed(sender: UIButton) {
   //  var ComingVal = sender.currentTitle!
      
    }
    


    @IBAction func ClearCh(sender: UIButton) {
        
        var IsTyped = false
        Chspace = 0
        lblChannels.text = " "
    }
 
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
////        var selectedIndex = tabBarController!.selectedIndex
////        if selectedIndex == 1 
////        var ConfigSegue: ConfigViewController = segue.destinationViewController as!  ConfigViewController
////        ConfigSegue.delegate = self
//    
//    
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



