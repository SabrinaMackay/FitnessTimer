//
//  ViewController.swift
//  Fitness Timer
//
//  Created by Sabrina Mackay on 2020/07/13.
//  Copyright © 2020 Sabrina Mackay. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var seconds = 30 //default seconds
    var min = 0 //default min
    var displaySeconds=30
    var sets = 0
    var input = 0 //user input time
    var count = 1
    var temp = 0
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    var before = 0
    var after = 0
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var lblStepper: UILabel!
    
    @IBOutlet weak var lblMinutes: UILabel!
    @IBOutlet weak var stepperMinOutlet: UIStepper!
    @IBAction func stepperMin(_ sender: Any) {
        print(String(stepperOutlet.value))
        min = Int(stepperMinOutlet.value)
        if(stepperMinOutlet.value > 0){sliderOutlet.minimumValue = 0.0
        }
        if(stepperMinOutlet.value == 0){sliderOutlet.minimumValue = 10.0}
        sliderOutlet.value = sliderOutlet.minimumValue
        seconds = Int(sliderOutlet.minimumValue)
        if(Int(stepperMinOutlet.value) == 1){
            lblMinutes.text = String(min) + " minute"
            
        }
        else{
            lblMinutes.text = String(min) + " minutes"
        }
        if(stepperMinOutlet.value>0){
            if(stepperMinOutlet.value<10){
                if(seconds<10){
                    Label.text="0"+String(min)+":0"+String(seconds)
                }
                else{
                    Label.text="0"+String(min)+":"+String(seconds)
                }
                
            }
            else{
                if(seconds<10){
                    Label.text=String(min)+":0"+String(seconds)
                }
                else{
                    Label.text=String(min)+":"+String(seconds)
                }
                
            }
        }
        else{
            if(seconds<10){
                Label.text="00:0"+String(seconds)
            }
            else{
                Label.text="00:"+String(seconds)
            }
        }
        
    }
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBAction func stepper(_ sender: Any) {
        lblStepper.text = String(Int(stepperOutlet.value)) + " sets"
    }
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        if(stepperMinOutlet.value > 0){sliderOutlet.minimumValue = 0.0}
        if(stepperMinOutlet.value == 0){sliderOutlet.minimumValue = 10.0}
        seconds = Int(sender.value)
        //input = seconds
        //
        if(stepperMinOutlet.value>0){
            if(stepperMinOutlet.value<10){
                if(seconds<10){
                    Label.text="0"+String(min)+":0"+String(seconds)
                }
                else{
                    Label.text="0"+String(min)+":"+String(seconds)
                }
                
            }
            else{
                if(seconds<10){
                    Label.text=String(min)+":0"+String(seconds)
                }
                else{
                    Label.text=String(min)+":"+String(seconds)
                }
                
            }
        }
        else{
            if(seconds<10){
                Label.text="00:0"+String(seconds)
            }
            else{
                Label.text="00:"+String(seconds)
            }
        }
    }
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func Start(_ sender: Any) {
        seconds = Int(sliderOutlet.value)
        input = (min * 60 ) + Int(sliderOutlet.value)
        print("input:" + String(input))
        print("Sets:" + String(sets))
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        
    }
    
    @objc func counter(){
        sets = Int(stepperOutlet.value)
        print("input:" + String(input))
        print("Sets:" + String(sets))
        print("Count:" + String(count))
        if(seconds == 0 && min>0)
        {   min-=1
            seconds = 60
        }
        seconds-=1
        
        if(min>0){
            if(stepperMinOutlet.value<10){
                if(seconds<10){
                    Label.text="0"+String(min)+":0"+String(seconds)
                }
                else{
                    Label.text="0"+String(min)+":"+String(seconds)
                }
                
            }
            else{
                if(seconds<10){
                    Label.text=String(min)+":0"+String(seconds)
                }
                else{
                    Label.text=String(min)+":"+String(seconds)
                }
                
            }
        }
        else{
            if(seconds<10){
                Label.text="00:0"+String(seconds)
            }
            else{
                Label.text="00:"+String(seconds)
            }
        }
        
        if (count<sets && seconds == 0) {
            timer.invalidate()
            seconds = input
            count += 1
            print("Seconds:" + String(seconds))
            print("Count:" + String(count))
            timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
            
        }
        else if(seconds==0 && count==sets){
            timer.invalidate()
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
            sliderOutlet.value=10
            seconds=10
            count=1
            if(stepperMinOutlet.value>0){
                if(stepperMinOutlet.value<10){
                    if(seconds<10){
                        Label.text="0"+String(min)+":0"+String(seconds)
                    }
                    else{
                        Label.text="0"+String(min)+":"+String(seconds)
                    }
                }
                else{
                    if(seconds<10){
                        Label.text=String(min)+":0"+String(seconds)
                    }
                    else{
                        Label.text=String(min)+":"+String(seconds)
                    }
                }
            }
            else{
                if(seconds<10){
                    Label.text="00:0"+String(seconds)
                }
                else{
                    Label.text="00:"+String(seconds)
                }
            }
        }
        if(seconds==5 && min == 0){
            audioPlayer.play()
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func Stop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        stepperMinOutlet.value = 0.0
        min = Int(stepperMinOutlet.value)
        lblMinutes.text = String(min) + " minutes"
        sets = Int(stepperOutlet.value)
        sliderOutlet.setValue(30, animated: true)
        if(stepperMinOutlet.value>0){
            if(stepperMinOutlet.value<10){
                if(seconds<10){
                    Label.text="0"+String(min)+":0"+String(seconds)
                }
                else{
                    Label.text="0"+String(min)+":"+String(seconds)
                }
                
            }
            else{
                if(seconds<10){
                    Label.text=String(min)+":0"+String(seconds)
                }
                else{
                    Label.text=String(min)+":"+String(seconds)
                }
                
            }
        }
        else{
            if(seconds<10){
                Label.text="00:0"+String(seconds)
            }
            else{
                Label.text="00:"+String(seconds)
            }
        }
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
        audioPlayer.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperOutlet.minimumValue = 1.0
        stepperOutlet.maximumValue = 20.0
        stepperOutlet.value = 1.0
        stepperOutlet.autorepeat = false
        lblStepper.text = String(Int(stepperOutlet.value)) + " sets"
        stepperMinOutlet.minimumValue=0.0
        stepperMinOutlet.maximumValue=30.0
        stepperMinOutlet.value=0.0
        stepperMinOutlet.autorepeat=false
        lblMinutes.text = String(Int(stepperMinOutlet.value)) + " minutes"
        min = Int(stepperMinOutlet.value)
        do{
            let audiopath=Bundle.main.path(forResource: "alarm2", ofType: ".mp3")
            try audioPlayer=AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath!))
        }
        catch{
            //error
        }
    }


}

