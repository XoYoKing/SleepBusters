/********************************************************
 
 DataAccess.swift
 
 Team Name: PillowSoft
 
 Author(s): Klein Gomes
 
 Purpose:  The DataAccess class serves as a repository and
 I/O for SleepBusters. The Business layer will have to 
 invoke the DataAccess class inorder to receive Live sensor
 data or save/retreive data from the database.
 
 Known Bugs: None
 
 Copyright © 2015 PillowSoft. All rights reserved.
 
 ********************************************************/

import Foundation
import Alamofire

private let authUserName = "sleep"
private let authPassword = "GC979XOBc7PK#m@It3"
private let userprofileController = "UserProfile"
private let statsController = "Stats"
private var rootUrl = "https://sleepbustersapi.azurewebsites.net/"
private let httpAction = HttpAction()

class DataAccess {
    
    init(){
        
    }
    
    // MARK: Web API (TCP/IP)
    
    /**
    Creates a request to the WebApi for authenticating a user name and password and returns
    user profile with UserProfile.IsValidated set to true.
    - parameter UserName: The user's login name.
    - parameter Password: The user's password.
    :returns: a User Profile
    */
    func validateLogin(userName: String,password: String,callback: (NSData, String?) -> Void) -> Void {
        let queryString = rootUrl + userprofileController+"/Login?userName="+userName+"&password="+password
        let parameters = [
            "userName": userName,
            "password": password
        ]
        
        Alamofire
            .request(.POST, queryString, parameters: parameters, encoding: .JSON)
            .responseData { response in
            print(response.request)
            print(response.response)
            print(response.result)
        }
        // HTTP body: {"foo": [1, 2, 3], "bar": {"baz": "qux"}}
        
        //httpAction.HTTPGetAsync(userName,password, callback: callback)(queryString)
    }
    
    /**
     Creates a request to the WebApi to get a collection of User Sleep Session from the database
     - parameter UserId: The user's ID
     - parameter startDate: The start date of the sleep session.
     - parameter endDate: The end date of the sleep session.
     :returns: Array of Sleep Sessions
     */
    func getUserSleepSessions(userId: Int, startDate: NSDate, endDate: NSDate) -> [UserSleepSession]{
        var userSleepSessions = [UserSleepSession()]
        let userPro = UserProfile()
        userPro.Id = 1
        for var index = 0; index < 7; index++
        {
            let userSleep = UserSleepSession()
            
            userSleep.User = userPro
            userSleep.TotalLightSleepHours = Double(Int(arc4random_uniform(5)))
            userSleep.TotalAwakeHours = Double(Int(arc4random_uniform(5)))
            userSleep.TotalDeepSleepHours = Double(Int(arc4random_uniform(11)))
            let totalHours = userSleep.TotalLightSleepHours! + userSleep.TotalAwakeHours! + userSleep.TotalDeepSleepHours!
            userSleep.TotalHoursAsleep = Double(totalHours)
            userSleepSessions.append(userSleep)
        }
        return userSleepSessions
    }
    
    /**
     Creates a request to the WebApi to get a collection of User Sleep Session from the database.
     - parameter UserId: The user's ID
     - parameter n: The user's last N user sessions from the database.
     :returns: Array of N Sleep Sessions
     */
    func getLastNSleepSessions(userId: Int, n: Int) -> [UserSleepSession]{
        var userSleepSessions = [UserSleepSession()]
        let userPro = UserProfile()
        userPro.Id = userId;
        for var index = 0; index < n; index++
        {
            let userSleep = UserSleepSession()
            userSleep.User = userPro
            userSleep.TotalLightSleepHours = Double(Int(arc4random_uniform(5)))
            userSleep.TotalAwakeHours = Double(Int(arc4random_uniform(5)))
            userSleep.TotalDeepSleepHours = Double(Int(arc4random_uniform(11)))
            let totalHours = userSleep.TotalLightSleepHours! + userSleep.TotalAwakeHours! + userSleep.TotalDeepSleepHours!
            userSleep.TotalHoursAsleep = Double(totalHours)
            userSleepSessions.append(userSleep)
        }
        return userSleepSessions
    }
    
    /**
     Creates a request to the WebApi to save/update a User Sleep Session to the database.
     - parameter UserSleepSession: The User Profile to update. (Update User Sleep Session)
     :returns: Is Success
     */
    func saveUserSleepSession(userSleepSession: UserSleepSession) ->  Bool
    {
        let queryString = rootUrl + userprofileController+"/SaveUserSleepSession"
        httpAction.HTTPPost(NSDictionary(), url: queryString){
            (data: NSDictionary, error: NSError?) -> Void in
            if error != nil {
                print(error)
              //  return false;
            } else {
              //  return true;
            }
            
        }
        return true;
    }

    /**
     Creates a request to the WebApi to Register a new User Account.
     - parameter UserProfile: The User Profile to register. (Create account)
     :returns: a User Profile
     */
    func registerUserProfile(user: UserProfile) -> UserProfile {
        let queryString = rootUrl + userprofileController+"/Register"
        httpAction.HTTPPost(NSDictionary(), url: queryString){
            (data: NSDictionary, error: NSError?) -> Void in
            if error != nil {
                print(error)
                // error
            } else {
                // success
            }
            
        }
        return UserProfile();
    }
    
    /**
     Creates a request to the WebApi to retrieve a User Profile from the database.
     - parameter UserId: The user's ID
     :returns: a User Profile
     */
    func getUserProfile(userId: Int) -> UserProfile {
        return UserProfile()
    }
    
    /**
     Creates a request to the WebApi to save/update a User Profile to the database.
     - parameter UserProfile: The User Profile to update. (Update account)
     :returns: The user profile that was just saved
     */
    func saveUserProfile(userProfile: UserProfile) -> UserProfile {
        return UserProfile()
    }
    
    // MARK: Hardware Sensors (Bluetooth)
    
    // TODO
    // Implement this
    func getHistoricalSensorData(userId: Int, startDate: NSDate, endDate: NSDate) -> [UserSensorStat]{
        return [UserSensorStat]()
    }
    
    // TODO
    // Implement this
    func saveUserSensorStats(stats: [UserSensorStat]) -> StatusResult {
        return StatusResult()
    }

    // TODO
    // Implement this
    func getLiveSensorData() -> UserSensorStat{
        return UserSensorStat()
    }
}