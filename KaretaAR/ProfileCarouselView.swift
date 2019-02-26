//
//  ProfileCarouselView.swift
//  KaretaAR
//
//  Created by 笠原未来 on 2019/02/19.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class ProfileCarouselView: UICollectionView {
    
    let cellIdentifier = "carousel"
    let pageCount = 5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(CarouselCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    convenience init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 200)
        layout.scrollDirection = .vertical
        
        self.init(frame: frame, collectionViewLayout: layout)
        
        // 垂直方向のスクロールバーを非表示にする
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = UIColor.white
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension ProfileCarouselView: UICollectionViewDelegate {
    
}

extension ProfileCarouselView: UICollectionViewDataSource {
    // セクションごとのセル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pageCount
    }
    
    // セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor.green
        return cell
    }
}
