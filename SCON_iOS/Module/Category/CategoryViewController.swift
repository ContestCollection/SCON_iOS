//
//  CategoryViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/23.
//

import UIKit
import Tabman
import Pageboy


class CategoryViewController: TabmanViewController {
    
    //MARK: - 변수
    private var viewControllers: Array<UIViewController> = []
    var contestListId: Int = 0 //경진대회 종류 id 값
    private var contestYearList: ContestYear = ContestYear(id: 0, name: "실패", year: ["실패","ㅠㅠ"])

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        connectToTapbar()
        setupLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "\(contestYearList.name) 수상작들"
        self.navigationController?.customNavigation()
    }
    
    //MARK: - private func
    private func bindData(){
        let result = APIKit.shared.request(url: "ContestYear", params: ["id": contestListId], type: ContestYear.self)
        switch result{
        case .success(let data):
            self.contestYearList = data
        case .failure(let error):
            print("에러: \(error.localizedDescription)")
        }
    }
    
    private func setupLayout(){
        self.dataSource = self
        self.createTabBar() //하단 탭바
        
    }
    private func connectToTapbar(){
        let storyboard = UIStoryboard.init(name: "Category", bundle: nil)
        for idx in contestYearList.year {
            let vc = storyboard.instantiateViewController(withIdentifier: "CategoryDetailViewController") as! CategoryDetailViewController
            //해당 년도의 수상작들 뷰컨으로 넘길 코드 작성하기
            vc.categoryDetailYear = Int(idx) ?? 1000
            vc.categorySortId = contestListId
            viewControllers.append(vc)
        }
    }
    // Create Tabbar
    private func createTabBar() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10.0, right: 10)
        bar.backgroundView.style = .blur(style: .regular) //투명해짐
        bar.indicator.overscrollBehavior = .bounce //인디케이터 설정
        bar.layout.contentMode = .fit //탭바의 크기에 맞춰서
        //인디케이터 조정
        bar.indicator.weight = .light
        bar.indicator.overscrollBehavior = .compress
        bar.indicator.tintColor = UIColor(named: "darkYellow")
        bar.buttons.customize { button in
            button.tintColor = .darkGray
            button.selectedTintColor = UIColor(named: "darkYellow")
        }
        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }

}
//MARK: - TabmanVC- DataSource
extension CategoryViewController: PageboyViewControllerDataSource, TMBarDataSource{
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
            let item = TMBarItem(title: "")
            item.title = contestYearList.year[index]
            return item
        }
        
        func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
            return viewControllers.count
        }

        func viewController(for pageboyViewController: PageboyViewController,
                            at index: PageboyViewController.PageIndex) -> UIViewController? {
            return viewControllers[index]
        }

        func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
            return nil
        }
    
}
