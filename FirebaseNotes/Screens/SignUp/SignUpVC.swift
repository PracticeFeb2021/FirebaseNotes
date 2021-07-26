
import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: SignUpViewModel!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Sign Up"
        
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        guard let username = userNameTextField.text,
              !username.isEmpty,
              let email = emailTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty else {
                showAlert(title: "Error", message: "Please enter all fields")
            return
        }
        //TODO: validate
        viewModel.signUp(username: username,
                         email: email,
                         password: password)
    }
}
