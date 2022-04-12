//
//  DetailViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/25.
//

import UIKit
import youtube_ios_player_helper

class DetailViewController: UIViewController {
    
    @IBOutlet weak var youtubeView: YTPlayerView!
    @IBOutlet weak var titleView: UIView!
    //타이틀 뷰
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var awardDetailLabel: UILabel!
    //상세 뷰
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var memberInfoLabel: UILabel!
    @IBOutlet weak var devSkillLabel: UILabel!
    @IBOutlet weak var calendarLabel: UILabel!
    
    var detailInfo: PrizeListData?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        ConnectLabelData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //네비게이션 설정
        self.navigationItem.title = detailInfo?.name
        self.navigationController?.customNavigation()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "house"), style: .done, target: self, action: #selector(homeTapped))
    }
    
    
    //MARK: - private func
    
    private func updateUI(){
        guard let youtubeLink = detailInfo?.infoDetail.youtubeLink else { return }
        youtubeView.load(withVideoId: youtubeLink)
        titleView.makeShadow()
    }
    
    private func ConnectLabelData(){
        //타이틀 뷰 라벨들
        nameLabel.text = detailInfo?.name
        subTitleLabel.text = detailInfo?.subTitle
        //서브 뷰 라벨들
        awardDetailLabel.text = detailInfo?.infoDetail.awardDetail
        summaryLabel.text = detailInfo?.infoDetail.summary
        memberInfoLabel.text = detailInfo?.infoDetail.people
        devSkillLabel.text = detailInfo?.infoDetail.skills
        calendarLabel.text = detailInfo?.infoDetail.calendar
    }
    
    private func urlToWebView(_ url: String, title: String){
        let webVC = WebViewController()
        webVC.url = url
        webVC.navigationTItle = title
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    //MARK: - Action Button
    @IBAction func tapServiceLinkBtn(_ sender: UIButton) {
        guard let serviceLink = detailInfo?.infoDetail.serviceLink else { return }
        self.urlToWebView(serviceLink, title: "서비스 링크")
        
    }
    
    @IBAction func tapGithubBtn(_ sender: UIButton) {
        guard let gitLink = detailInfo?.infoDetail.gitLink else { return }
        self.urlToWebView(gitLink, title: "깃허브 링크")
    }
    
    
    //네비게이션 홈버튼
    @objc func homeTapped(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }

}
