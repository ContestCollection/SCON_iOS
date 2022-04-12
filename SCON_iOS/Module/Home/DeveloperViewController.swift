//
//  DeveloperViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/04/12.
//

import UIKit
import Kingfisher

class DeveloperViewController: UIViewController {

    @IBOutlet weak var img_ios: UIImageView!
    @IBOutlet weak var img_web1: UIImageView!
    @IBOutlet weak var img_web2: UIImageView!
    @IBOutlet weak var img_server: UIImageView!
    
    private let urlList = [
        "https://avatars.githubusercontent.com/u/37897873?v=4",
        "https://avatars.githubusercontent.com/u/63100352?v=4",
        "https://avatars.githubusercontent.com/u/37800677?v=4",
        "https://avatars.githubusercontent.com/u/49190602?v=4"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "개발자 소개"
        [img_ios, img_web1, img_web2, img_server].enumerated().forEach {
            let val = $0.1!
            val.makeRounded()
            urlToImg(img: val, url: urlList[$0.0])
        }
    }
    
    private func urlToImg(img: UIImageView, url: String){
        img.kf.setImage(with: URL(string: url))
    }
    

}
