//
//  DatabaseManager.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 03/01/2023.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    //MARK : public
    //validate username,email envailable
    ///Check if username and email is available
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    ///Insert new user to database
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        let key = email.safeDatabseKey()
        print(key)
        
        database.child(key).setValue(["username": username]) {
            error, _ in
            if error == nil {
                //succes
                completion(true)
                return
            }
            else {
                //failed
                completion(false)
                return
            }
        }
    }
    
    //MARK : private
    private func safeKey(){
        
    }
    
}
