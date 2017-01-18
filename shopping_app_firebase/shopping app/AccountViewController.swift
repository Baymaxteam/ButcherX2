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
    
    //當這個頁面被載入時
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 如果已經有登入的使用者帳號，則顯示帳號跟歡迎回來的文字
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                print("Account : User log in")
                print(user!.email!)
                self.userInfo = User(authData: user!)
                self.labelSignIn.text! = "\(user!.email!) \n歡迎回來！"
                self.AccountStatusHidden(loginState: false)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    // 當登入按鈕被按下時產生的動作
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        FIRAuth.auth()?.signIn(withEmail: textFieldLoginEmail.text!, password: textFieldLoginPassword.text!) { (user, error) in
            //判斷是否輸入有誤，若是有錯誤則跳出錯誤訊息
            if error != nil {
                let passwordAlert = UIAlertController(title: "帳號密碼有誤",
                    message: "請確認密碼輸入正確", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "取消", style: .default)
                passwordAlert.addAction(cancelAction)
                self.present(passwordAlert, animated: true, completion: nil)
            }
            //若與資料庫相符，則顯示帳號跟歡迎回來的文字
            if user != nil {
                print("Account : User log in")
                self.AccountStatusHidden(loginState: false)
                self.labelSignIn.text! = "\(user!.email!) \n歡迎回來！"
            }
        }
        
    }
    // 當註冊按鈕被按下時
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "註冊帳號",
                                      message: "請輸入Email帳號與密碼",
                                      preferredStyle: .alert)
        //將輸入的資料儲存至資料庫
        let saveAction = UIAlertAction(title: "註冊", style: .default) { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            FIRAuth.auth()!.createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
                if error == nil {
                    FIRAuth.auth()!.signIn(withEmail: self.textFieldLoginEmail.text!, password: self.textFieldLoginPassword.text!)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "取消註冊",style: .default)
        
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
    
    //登出按鈕按下時，則回到登入畫面
    @IBAction func signoutButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        print("Account : User log out")
        AccountStatusHidden(loginState: true)
        try! FIRAuth.auth()!.signOut()

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
