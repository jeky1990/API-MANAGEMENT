//
//  AccountManager.swift
//  DemologinAppUsingAPIcall
//
//  Created by macbook on 18/12/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import Foundation

class AccountManager : NSObject
{
    static let sharedInstance = AccountManager()
    
    //---- Global Declaration of variable
    var activeAccount : Account? = nil{
        willSet(activeAccount){
            self.activeAccount = activeAccount
            saveAccount()
        }
    }
    
    //---- Saved data to Account
    var savedAccounts = [AnyHashable:Any]()
    
    func accountFileName() -> String?
    {
        let documetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        return URL(fileURLWithPath: documetPath!).appendingPathComponent("demoLogIn.dat").absoluteString
    }
    
    override init() {
        super.init()
        
        let accountData = UserDefaults.standard.object(forKey: "ActiveUserKey") as? Data
        if accountData != nil
        {
            if let aData = accountData
            {
                activeAccount = NSKeyedUnarchiver.unarchiveObject(with: aData) as? Account
            }
        }
        
        guard ((NSKeyedUnarchiver.unarchiveObject(withFile: accountFileName()!) as? [AnyHashable:Any]) != nil) else
        {
            savedAccounts = [AnyHashable:Any]()
            return
        }
        
        savedAccounts = NSKeyedUnarchiver.unarchiveObject(withFile: accountFileName()!) as! [AnyHashable:Any]
    }
    
    func saveAccounts()
    {
        NSKeyedArchiver.archiveRootObject(savedAccounts, toFile: accountFileName()!)
    }
    
    func saveAccount()
    {
        var data : Data? = nil
        if activeAccount != nil
        {
            data = NSKeyedArchiver.archivedData(withRootObject: activeAccount!)
        }
        if data != nil
        {
            UserDefaults.standard.set(data, forKey: "ActiveUserKey")
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: "ActiveUserKey")
        }
        if (activeAccount != nil)
        {
            saveAccounts()
        }
        UserDefaults.standard.synchronize()
    }
}
