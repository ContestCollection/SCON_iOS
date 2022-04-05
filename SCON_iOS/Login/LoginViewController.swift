//
//  LoginViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/05.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var defaultLoginBtn: UIButton!
    @IBOutlet weak var memberJoinBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [googleLoginBtn, defaultLoginBtn, memberJoinBtn].forEach { btn in
            btn?.makeCircleAndbgColor(bgColor: .systemYellow)
        }
    }
   

}
