import UIKit
import Firebase

class AccountViewController: UIViewController {

    // MARK: Constants
    let loginToList = "LoginToList"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var CreatAccount: UIButton!
    @IBOutlet weak var SignOut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                print("Account : User log in")
                self.buttonLogin.isHidden = true
                self.CreatAccount.isHidden = true
                self.SignOut.isHidden = false
//                self.performSegue(withIdentifier: self.loginToList, sender: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        // performSegue(withIdentifier: loginToList, sender: nil)
        // FIRAuth.auth()!.signIn(withEmail: textFieldLoginEmail.text!,
        //                        password: textFieldLoginPassword.text!)
        
        FIRAuth.auth()?.signIn(withEmail: textFieldLoginEmail.text!, password: textFieldLoginPassword.text!) { (user, error) in
            if error != nil {
                let passwordAlert = UIAlertController(title: "Type error",
                                                      message: "check your account and password",
                                                      preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel",
                                                 style: .default)
                passwordAlert.addAction(cancelAction)
                self.present(passwordAlert, animated: true, completion: nil)
            }
            if user != nil {
                print("Account : User log in")
                self.buttonLogin.isHidden = true
                self.CreatAccount.isHidden = true
                self.SignOut.isHidden = false
                //                self.performSegue(withIdentifier: self.loginToList, sender: nil)
            }
        }
        
    }
    
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
                                        
                                        let emailField = alert.textFields![0]
                                        let passwordField = alert.textFields![1]
                                        
                                        
                                        FIRAuth.auth()!.createUser(withEmail: emailField.text!,
                                                                   password: passwordField.text!) { user, error in
                                                                    if error == nil {
                                                                        
                                                                        FIRAuth.auth()!.signIn(withEmail: self.textFieldLoginEmail.text!,
                                                                                               password: self.textFieldLoginPassword.text!)
                                                                    }
                                        }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signoutButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        print("Account : User log out")
        self.buttonLogin.isHidden = false
        self.CreatAccount.isHidden = false
        self.SignOut.isHidden = true
    }
}

extension AccountViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLoginEmail {
            textFieldLoginPassword.becomeFirstResponder()
        }
        if textField == textFieldLoginPassword {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
