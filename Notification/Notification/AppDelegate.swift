//
//  AppDelegate.swift
//  Notification
//
//  Created by VipalKharva on 2022-12-15.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate
    {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerForPushNotifications()
        return true
    }
    
    private func registerForPushNotifications() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert,.badge,.sound]) {  granted,error in
                // 1. Check to see if permission is granted
            if let error = error {
                print("error: \(error.localizedDescription)")
                return
               }
            if granted {
                print("granted")
                // 2. Attempt registration for remote notifications on the main thread
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                    self.setNotificationCatagories()
                }
              
            }else{
                print("error: not  granted")
                return
            }
            
        }
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
       
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    func setNotificationCatagories(){
        let HomePage = UNNotificationAction(identifier: UNNotificationDefaultActionIdentifier, title: "Open Home Page",options: .foreground)
        let cat =   UNNotificationCategory(identifier: "cat_id", actions: [HomePage], intentIdentifiers: [],options: UNNotificationCategoryOptions.customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([cat])
        
    }
        
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
//        let title = response.notification.request.content.title
//        let badge = response.notification.request.content.badge
//        let subtitle = response.notification.request.content.subtitle
//    
//         let userInfo = response.notification.request.content.userInfo
//            if let name = userInfo["name"] as? String {
//                print(name)
//            }
//            if let id = userInfo["id"] as? Int {
//                print(id)
//            }
//        
//        print("title:\(title),badge:\(badge),subtitle:\(subtitle)")
    }

}
extension AppDelegate: UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
}
