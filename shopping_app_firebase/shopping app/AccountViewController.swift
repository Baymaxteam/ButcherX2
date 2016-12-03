import UIKit
import Firebase

class AccountViewController: UIViewController {

    // MARK: Constants
    let listToUsers = "ListToUsers"
    
    // MARK: Properties
    var items: [CartOrderList] = []
    var userInfo: User!
    
    
    // firebase user status
    //    let usersRef = FIRDatabase.database().reference(withPath: "online")
    
    // MARK: Constants
    let loginToList = "LoginToList"
    
    // MARK: Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var CreatAccount: UIButton!
    @IBOutlet weak var SignOut: UIButton!
    
    @IBOutlet weak var imgaeEmail: UIImageView!
    @IBOutlet weak var imagePassword: UIImageView!
    @IBOutlet weak var labelSignIn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                print("Account : User log in")
                print(user!.email!)
                self.userInfo = User(authData: user!)
                self.labelSignIn.text! = "\(user!.email!) \n歡迎回來！"
                self.AccountStatusHidden(loginState: false)
//                self.performSegue(withIdentifier: self.loginToList, sender: nil)
            }
        }
        
        
        // check data
        
        
        
//        user = User(uid: "FakeId", email: "hungry@person.food")
//        // update user
//        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            self.user = User(authData: user)
//            
//            // user status
//            let currentUserRef = self.usersRef.child(self.user.uid)
//            currentUserRef.setValue(self.user.email)
//            currentUserRef.onDisconnectRemoveValue()
//        }
//        
//        ref.observe(.value, with: { snapshot in
//            var newItems: [CartOrderList] = []
//            for item in snapshot.children {
//                let cartOrderList = CartOrderList(snapshot: item as! FIRDataSnapshot)
//                newItems.append(cartOrderList)
//            }
//            
//            self.items = newItems
//            print(snapshot.value!)
//        })

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
                let passwordAlert = UIAlertController(title: "帳號密碼有誤",
                                                      message: "請確認密碼輸入正確",
                                                      preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "取消",
                                                 style: .default)
                passwordAlert.addAction(cancelAction)
                self.present(passwordAlert, animated: true, completion: nil)
            }
            if user != nil {
                
                print("Account : User log in")
                self.AccountStatusHidden(loginState: false)
                self.labelSignIn.text! = "\(user!.email!) \n歡迎回來！"
                //                self.performSegue(withIdentifier: self.loginToList, sender: nil)
            }
        }
        
    }
    
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "註冊帳號",
                                      message: "請輸入Email帳號與密碼",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "註冊",
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
        
        let cancelAction = UIAlertAction(title: "取消註冊",
                                         style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "輸入您的信箱"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "輸入您的密碼"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signoutButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        print("Account : User log out")
        AccountStatusHidden(loginState: true)
    }
    
    func AccountStatusHidden(loginState: Bool) -> Void {
        if loginState{
            self.buttonLogin.isHidden = false
            self.CreatAccount.isHidden = false
            self.SignOut.isHidden = true
            
            self.textFieldLoginEmail.isHidden = false
            self.textFieldLoginPassword.isHidden = false
            self.imgaeEmail.isHidden = false
            self.imagePassword.isHidden = false
            
            self.labelSignIn.isHidden = true
        }else{
            self.buttonLogin.isHidden = true
            self.CreatAccount.isHidden = true
            self.SignOut.isHidden = false
            self.textFieldLoginEmail.isHidden = true
            self.textFieldLoginPassword.isHidden = true
            self.imgaeEmail.isHidden = true
            self.imagePassword.isHidden = true
            self.labelSignIn.isHidden = false
        }
       
    }
    
    
    
    // test send order
        @IBAction func sendButtonDidTouch(_ sender: AnyObject) {
            // Creating a Connection to Firebase
            let ref = FIRDatabase.database().reference(withPath: "order-items")
            let text = "order_test"
            let userEmail = "qq@gmail.com"
            let orderTime = "2016/12/2-18:09"
            let orderPrice = 1233 as Int
            var orderItems = [String: Int]()
            orderItems["豬肉"] = 3
            orderItems["香腸"] = 10
            print(orderItems)
    
            let alert = UIAlertController(title: "送出訂單",
                                          message: nil,
                                          preferredStyle: .alert)
    
            let saveAction = UIAlertAction(title: "確認",style: .default) { _ in
                // guard let textField = alert.textFields?.first,
                // let text = textField.text else { return }
                // let cartOrderList = CartOrderList(name: text, addedByUser: self.user.email,completed: false)
                
                let cartOrderList = CartOrderList(orderByUser: self.userInfo.email ,
                                                  orderByTime: orderTime, orderByPrice: orderPrice,
                                                  orderByItemAndNumber: orderItems)
                let cartOrderListRef = ref.child(text.lowercased())
                cartOrderListRef.setValue(cartOrderList.toAnyObject())
            }
    
            let cancelAction = UIAlertAction(title: "取消",
                                             style: .default)
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
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
