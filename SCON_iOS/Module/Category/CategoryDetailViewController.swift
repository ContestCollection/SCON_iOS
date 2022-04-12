//
//  TwenyOneViewController.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/23.
//

import UIKit
import Kingfisher

class CategoryDetailViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    private var prizeListHeader: [PrizeListHeader] = []
    var categoryDetailYear: Int = 2021 //몇년도인지 값
    var categorySortId: Int = 0 //경진대회 종류 id
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bindData()
    }
    

    //MARK: - private func
    private func setupLayout(){
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.collectionViewLayout = createLayout()
    }
    
    private func bindData(){
        let result = APIKit.shared.request(url: "PrizeList", params: ["id": categorySortId, "year": categoryDetailYear], type: PrizeList.self)
        switch result{
        case .success(let data):
            self.prizeListHeader = data.headerList
        case .failure(let error):
            debugPrint("디테일에러: ",error)
        }
        
    }
    
}



//MARK: - UICollectionViewDataSource
extension CategoryDetailViewController: UICollectionViewDataSource{
    //섹션 당 보여질 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prizeListHeader[section].prizeListData.count
//        return arrData[section].dataList.count
    }
    //콜렉션 뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkCollectionViewCell", for: indexPath) as? WorkCollectionViewCell else { return UICollectionViewCell() }
        let dataList = prizeListHeader[indexPath.section].prizeListData[indexPath.row]
        let imageURL = URL(string: dataList.img)
        cell.imageView.kf.setImage(with: imageURL)
        cell.titleLabel.text = dataList.name
        cell.descriptionLabel.text = dataList.subTitle

        return cell
    }
    //섹션의 개수 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return prizeListHeader.count
    }
    
    //섹션의 헤더 사용하기 위해 구현
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as? HeaderCollectionReusableView
            else { fatalError("Could not dequeue Header") }
            headerView.titleLabel.text = self.prizeListHeader[indexPath.section].prizeHeader
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }


   
   
}


//MARK: - UICollectionViewDelegate
extension CategoryDetailViewController: UICollectionViewDelegate{
    //셀 선택시 동작
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        let dataList = prizeListHeader[indexPath.section].prizeListData[indexPath.row]
        detailVC.detailInfo = dataList
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
