
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username : String, email : String, password: String, completion: @escaping (Bool) -> Void){
        //check username, email is available
        //create account
        //insert database
        DatabaseManager.shared.canCreateNewUser(with: email,
                                                username: username) { canCreate in
            //create accoun, add to database
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) {
                    result, error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    //insert to database
                    DatabaseManager.shared.insertNewUser(with: email,
                                                         username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else {
                            //insert fail
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //username, email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        if let email = email {
            //login by email
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            //login by username
            print(username)
        }
    }
    ///Attempt to logout firebase user
    public func logOut(completion: (Bool)->Void){
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}
