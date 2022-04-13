//
//  Extenstion.swift
//  SCON_iOS
//
//  Created by 김지인 on 2022/03/29.
//

import UIKit

//MARK: - CollectionViewLayout
extension UIViewController{
    func createLayout() -> UICollectionViewLayout {
        // 레이아웃 생성 - 섹션 > 아이템 > 그룹 이렇게 포함됨
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironMent: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            //아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.9))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //아이템 간 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            //그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(180))
            // 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            section.orthogonalScrollingBehavior = .continuous
            
            //섹션 헤더 설정
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(30))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
        }
        return layout
    }
}

extension UIView{
    func makeShadow(){
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
    }
    func makeRounded() {
        layer.cornerRadius = (self.frame.width / 2)
        layer.masksToBounds = true
    }
}

extension UINavigationController{
    func customNavigation() {
        navigationBar.tintColor = UIColor(named: "darkYellow")
        navigationBar.topItem?.title = ""
    }
}

//버튼 백그라운드, 둥글게 만들기
extension UIButton{
    func makeCircleAndbgColor(bgColor: UIColor){
        backgroundColor = bgColor
        layer.cornerRadius = 20
    }
}
