//
//  ViewController.swift
//  Notification
//
//  Created by VipalKharva on 2022-12-15.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  setNotification()
    }
    private func setNotification(){
        //set notification content
        let content = UNMutableNotificationContent()
        content.sound = .default
        content.badge = 1
        content.title = "Main Title"
        content.subtitle = "SubTitle"
     
        
        var userInfo = [AnyHashable : Any]()
        userInfo["id"] = 1
        userInfo["name"] = "Ram"
        
        content.userInfo = userInfo
        
        //set timeInterval
        let timeInterval =  UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        //create request with Identifre
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: timeInterval)
        //get the instance and ad notification
        UNUserNotificationCenter.current().add(request)
    }

}

