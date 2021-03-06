/********************************************************
 Business.swift
 
 Team Name: PillowSoft
 
 Author(s): Conrad Yeung, Klein Gomes
 
 Purpose:  All Business Logic is located here.
 All SleepBusters calculations will be done here.
 
 Known Bugs: None
 
 Copyright © 2015 PillowSoft. All rights reserved.
 
 ********************************************************/

import Foundation
class Business {
    
    var data = DataAccess()
    var sensorStatArray = [UserSensorStat]()
    var userSleepSession = UserSleepSession()
    
    init(){
       
    }
    
    
    // MARK: User Profile CRUD
    
    /**
    Creates a request to the WebApi for authenticating a user name and password and returns
    user profile with UserProfile.IsValidated set to true.
    - parameter UserName: The user's login name.
    - parameter Password: The user's password.
    :returns: a User Profile
    */
    func login(userName: String,password: String,callback: (UserProfile, NSError?) -> Void) {
        data.login(userName, password: password)
        { (data: UserProfile, error: NSError?) -> Void in
                callback(data,error)
        }
    }
    
    /**
     Creates a request to the WebApi to Register a new User Account.
     - parameter UserProfile: The User Profile to register. (Create account)
     :returns: a User Profile
     */
    func registerUserProfile(userProfile: UserProfile,callback: (UserProfile, NSError?) -> Void) {
        data.registerUserProfile(userProfile)
            { (data: UserProfile, error: NSError?) -> Void in
                callback(data,error)
        }
    }
    
    /**
     Creates a request to the WebApi to retrieve a User Profile from the database.
     - parameter UserId: The user's ID
     :returns: a User Profile
     */
    func getUserProfile(callback: (UserProfile, NSError?) -> Void) {
        data.getUserProfile()
            { (data: UserProfile, error: NSError?) -> Void in
                callback(data,error)
        }
    }
    
    /**
     Creates a request to the WebApi to save/update a User Profile to the database.
     - parameter UserProfile: The User Profile to update. (Update account)
     :returns: The user profile that was just saved
     */
    func saveUserProfile(userProfile: UserProfile,callback: (UserProfile, NSError?) -> Void) {
        data.saveUserProfile(userProfile)
            { (data: UserProfile, error: NSError?) -> Void in
                callback(data,error)
        }
    }
    
    /**
     Creates a request to the WebApi to save/update a User Sleep Session to the database.
     - parameter UserSleepSession: The User Profile to update. (Update User Sleep Session)
     :returns: Void
     */
    func saveUserSleepSession(userSleepSession: UserSleepSession) ->  Void{
        return data.saveUserSleepSession(userSleepSession)
    }
    
    /**
     Creates a request to the WebApi to save/update a User Sleep Stats to the database.
     - parameter UserSleepStat: The User Profile to update. (Update User Sleep stat)
     :returns:  Void
     */
    func saveSleepStat(userSensorStat: UserSensorStat){
        return data.saveSleepStat(userSensorStat)
    }

    /**
     Creates a request to the WebApi to get a collection of User Sleep Session from the database.
     - parameter UserId: The user's ID
     - parameter n: The user's last N user sessions from the database.
     :returns: Array of N Sleep Sessions
     */
    func getLastNSleepSessions(userId: Int, n: Int,callback: ([UserSleepSession], NSError?) -> Void) -> Void {
        data.getLastNSleepSessions(userId,n:n)
            { (data: [UserSleepSession], error: NSError?) -> Void in
                callback(data,error)
        }
    }
    
    /**
     Creates a request to the WebApi to get a single User Sleep Session from the database.
     - parameter UserId: The user's ID
     - parameter Date: The user sleep session date
     :returns: a UserSleepSession object
     */
    func getUserSleepSessionForDate(date: String,callback: (UserSleepSession, NSError?) -> Void) -> Void {
            data.getUserSleepSessionForDate(date)
            { (data: UserSleepSession, error: NSError?) -> Void in
                callback(data,error)
        }
    }
    
    
    /**
     Creates a request to the WebApi to get a collection of User Sleep Session from the database.
     - parameter UserId: The user's ID
     - parameter startDate: The start date of the sleep session.
     - parameter endDate: The end date of the sleep session.
     :returns: Array of Sleep Sessions
     */
    func getUserSleepSessions(userId: Int, startDate: NSDate, endDate: NSDate) -> [UserSleepSession]{
        return data.getUserSleepSessions(userId, startDate: startDate, endDate: endDate)
    }
    

    

    


}