//
//  AppDelegate.swift
//  HelloWorldRealm
//
//  Created by Michael Miles on 11/29/18.
//  Copyright © 2018 Michael Miles. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            let realm = try Realm()
        } catch {
            print("Error launching Realm in AppDelegate, \(error)")
        }
        // Override point for customization after application launch.
        return true
    }

}

