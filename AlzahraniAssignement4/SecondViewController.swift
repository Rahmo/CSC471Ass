//
//  SecondViewController.swift
//  AlzahraniAssignement4
//
//  Created by Abdulrahman on 2015-05-05.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var status = 0;
    var forceStatus = 0;
    var STOP = 0;//0 - stop
    var PLAY = 1;//1 - play
    var PAUSE = 2;//2 - pause
    var FWD = 3;//3 - fast fwd
    var RWD = 4;//4 - fast rwd
    var REC = 5;//5 - record
    var isPlay = false ;
    var isStop = false;
    var isPause = false;
    var isRec = false;
    var isFwd = false;
    var isRwd = false;
    @IBOutlet weak var PowerSwitcher: UISwitch!
    @IBOutlet weak var txtPower: UILabel!
    @IBOutlet weak var TopVeiw: UIView!
    @IBOutlet weak var BottomView: UIView!
    @IBOutlet weak var lblChannel: UILabel!
    @IBOutlet weak var BtnFF: UIButton!
    @IBOutlet weak var BtnRW: UIButton!
    @IBOutlet weak var BtnPlay: UIButton!
    @IBOutlet weak var BtnStop: UIButton!
    @IBOutlet weak var BtnPause: UIButton!
    @IBOutlet weak var BtnRecord: UIButton!
    
    
    override func viewDidLoad() {
        status = STOP;
        ChangeStatus(status)
        txtPower.text = "Off"
        TopVeiw.backgroundColor =  UIColor.orangeColor().colorWithAlphaComponent(0.1)
        BottomView.userInteractionEnabled = false
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PwrSwitcherClicked(sender: AnyObject) {
        if PowerSwitcher.on == true
        {
            txtPower.text = "On"
            TopVeiw.backgroundColor =  UIColor.greenColor().colorWithAlphaComponent(0.1)
            BottomView.userInteractionEnabled = true
        }
        else {
            txtPower.text = "Off"
            TopVeiw.backgroundColor =  UIColor.orangeColor().colorWithAlphaComponent(0.1)
            BottomView.userInteractionEnabled = false
        }

    
    
    }

    @IBAction func PlayPressed(sender: AnyObject) {
        if(isPlay)
        {
        status = PLAY
        ChangeStatus(status)
        }
        else
        {
        forceStatus = PLAY;
            popupMessage()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func TimelineControl(sender: UIButton) {
        
        if (isFwd || isRwd)
        {
            
            if(sender == BtnFF)
            {
                status = FWD;
            }
            else
            {
                status = RWD;
            }
             ChangeStatus(status)
  
        }
        else
        {
            if(sender == BtnRW)
            {
                forceStatus = RWD;
            }
            else
            {
                forceStatus = FWD;
            }
         
            
            popupMessage()
            
        }
        
        
    }
    
    @IBAction func PausePressed(sender: AnyObject) {
        if(isPause)
        {
            status = PAUSE;
              ChangeStatus(status)
        }

        else
        
        {
            forceStatus = PAUSE;
            popupMessage()
        }
        
    }
    
    @IBAction func RcdPressed(sender: AnyObject) {
        
        if(isRec)
        {
            if(status == STOP)
            {
                status = REC;
               ChangeStatus(status)
            }
        }
        else
        
        {
        forceStatus = REC
         popupMessage()
        }
    }
    
    @IBOutlet weak var StopPressed: UIButton!
    
    @IBAction func StpPressed(sender: AnyObject) {
        
        status = STOP;
          ChangeStatus(status)
    }
    
    
    func DisableCtrlTimeline(){
        isFwd = false;
        isRwd = false;
      
    }
    
    func EnableCtrlTimeline(){
        isRwd = true;
        isFwd = true;
      
       
    }
    
    func popupMessage()
    {
        var ConfirmAlert = UIAlertController(title: "Verify", message: "All data will be lost.", preferredStyle: UIAlertControllerStyle.Alert)
       
        
        var ConfirmedChangeAlert = UIAlertController(title: "Done", message: "You operation has been performed successfully", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        
        ConfirmAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
          self.status = self.forceStatus
             self.ChangeStatus(self.status)
             self.presentViewController(ConfirmedChangeAlert, animated: true, completion: nil)
            
        }))
        
        ConfirmAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
           //Nothing
        }))
        
        ConfirmedChangeAlert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action: UIAlertAction!) in
            //Nothing
        }))
        
         presentViewController(ConfirmAlert, animated: true, completion: nil)
    }
    
    
    func ChangeCtrlColors ()
    {
  
        switch (true)
        {
        case  lblChannel.text == "Stop" :
            BtnStop.backgroundColor =   UIColor.greenColor().colorWithAlphaComponent(0.1)
            BtnRW.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnPlay.backgroundColor =  UIColor.clearColor()
            BtnFF.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnRecord.backgroundColor =  UIColor.clearColor()
            BtnPause.backgroundColor =   UIColor.grayColor().colorWithAlphaComponent(0.1)
    //      BtnPause.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
//            BtnPause.setTitleColor(UIColor.brownColor(), forState: UIControlState.Highlighted)
        break;
        case lblChannel.text == "Play" :
            BtnPlay.backgroundColor =   UIColor.greenColor().colorWithAlphaComponent(0.1)
            BtnRW.backgroundColor =  UIColor.clearColor()
            BtnStop.backgroundColor =  UIColor.clearColor()
            BtnFF.backgroundColor =  UIColor.clearColor()
            BtnRecord.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnPause.backgroundColor =  UIColor.clearColor()
          
            break;
        case lblChannel.text == "Fast Rewind" :
            BtnRW.backgroundColor =   UIColor.greenColor().colorWithAlphaComponent(0.1)
            BtnStop.backgroundColor =  UIColor.clearColor()
            BtnPlay.backgroundColor =  UIColor.clearColor()
            BtnFF.backgroundColor =  UIColor.clearColor()
            BtnRecord.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnPause.backgroundColor =  UIColor.clearColor()
            break;
        case lblChannel.text == "Fast Foward" :
            BtnFF.backgroundColor =   UIColor.greenColor().colorWithAlphaComponent(0.1)
            BtnRW.backgroundColor =  UIColor.clearColor()
            BtnPlay.backgroundColor =  UIColor.clearColor()
            BtnStop.backgroundColor =  UIColor.clearColor()
            BtnRecord.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnPause.backgroundColor =  UIColor.clearColor()
            break;
          case lblChannel.text == "pause" :
            BtnPause.backgroundColor =   UIColor.greenColor().colorWithAlphaComponent(0.1)
            BtnRW.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnPlay.backgroundColor =  UIColor.clearColor()
            BtnFF.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnRecord.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnStop.backgroundColor =  UIColor.clearColor()
            break;
        case lblChannel.text == "Recording" :
            BtnRecord.backgroundColor =   UIColor.greenColor().colorWithAlphaComponent(0.1)
            BtnRW.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnPlay.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnFF.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            BtnStop.backgroundColor =  UIColor.clearColor()
            BtnPause.backgroundColor =  UIColor.grayColor().colorWithAlphaComponent(0.1)
            break;
        
        
        default:
       
            break;
        
        }
    }
    
    @IBAction func Dismiss(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func ChangeStatus(Status: Int) {
        var state = "";
        switch (Status) {
        case 0:
            state = "Stop";
            DisableCtrlTimeline()
            
            isPause = false;
            isPlay = true;
            isRec = true;
            break;
        case 1:
            state = "Play";
            EnableCtrlTimeline()
            isPause = true;
            isPlay = true;
            isRec = false;
            break;
        case 2:
            state = "pause";
            DisableCtrlTimeline()
            isPause = true;
            isPlay = true;
            isRec = false;
            break;
        case 3:
            state = "Fast Foward";
            EnableCtrlTimeline()
           
            isPause = true;
            isPlay = true;
            isRec = false;
            break;
        case 4:
            state = "Fast Rewind";
            EnableCtrlTimeline()
          
            isPause = true;
            isPlay = true;
            isRec = false;
            break;
        case 5:
            state = "Recording";
            DisableCtrlTimeline()
         
            isPause = false;
            isPlay = false;
            isRec = true;
            break;
        default:
            state = "ERROR";
            break;
        }
         lblChannel.text = state;
   ChangeCtrlColors()
        
    
    }
    
    
}
