//
//  ViewController.swift
//  BellRungApp
//
//  Created by Jarren Campos on 6/11/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit
import UserNotifications

class MainBellViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    static var savedRings: [ConsoleOutput] = []
    
    let audioPlayer = AudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userNotificationCenter.delegate = self
        self.requestNotificationAuthorization()
        self.sendNotification()
    }

    let userNotificationCenter = UNUserNotificationCenter.current()
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }

    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Ring!"
        notificationContent.body = "The bell has been rung"
        notificationContent.badge = NSNumber(value: 3)
        
        if let url = Bundle.main.url(forResource: "dune",
                                    withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "dune",
                                                            url: url,
                                                            options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    @IBAction func clickedBell(_ sender: Any) {
        sendNotification()
        MainBellViewController.savedRings.append(ConsoleOutput(name: "Bell rung", date: nil))
        audioPlayer.playBellSound()
    }
    
}

