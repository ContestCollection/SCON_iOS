//
//  DefaultLoginViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/05.
//

import UIKit
//import FirebaseAuth

class EmailLoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMsgLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //next 버튼 설정
        nextButton.makeCircleAndbgColor(bgColor: .yellow)
        nextButton.isEnabled = false
        //델리겟 연결
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder() //첫번째 커서가 이메일 입력폼
        
    }
    //화면 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func tappedNextBtn(_ sender: UIButton) {
        //Firebase 이메일, 비번 인증
//        let email = emailTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
        
        //신규 사용자
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
//            guard let self = self else { return }
//            if let error = error {
//                let code = (error as NSError).code
//                switch code {
//                case 17007: //이미 가입한 계정
//                    //로그인 하기
//                    self.loginUser(withEamil: email, password: password)
//                default:
//                    self.errorMsgLabel.text = error.localizedDescription
//                }
//            } else { //에러가 없으면
//                self.showMainVC()
//            }
//
//        }
    }
    
    //메인 뷰로 넘어가기
    private func showMainVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC")
        mainVC.modalPresentationStyle = .fullScreen
        navigationController?.show(mainVC, sender: nil)
    }
    //로그인 하기
//    private func loginUser(withEamil email: String, password: String){
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
//            guard let self = self else { return }
//            if let error = error {
//                self.errorMsgLabel.text = error.localizedDescription
//            } else {
//                self.showMainVC()
//            }
//        }
//    }

}


extension EmailLoginViewController: UITextFieldDelegate{
    //입력이 완료 되면 키보드 내림 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nextButton.isEnabled = emailTextField.text != "" && passwordTextField.text != "" ? true : false
    }
}
