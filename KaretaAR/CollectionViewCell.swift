//
//  CollectionViewCell.swift
//  KaretaAR
//
//  Created by 笠原未来 on 2019/02/05.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var baseView:UIView?
    let paddingSize:CGFloat = 8
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // コンテンツビューに対しパディングをもうけたビューを生成して貼る（ページング吸着対応）
        baseView = UIView(frame:CGRect(x:paddingSize,y:paddingSize,width:frame.width-(paddingSize*2),height:frame.height))
        self.contentView.addSubview(baseView!)
    }
    
    // ベースビューの背景色を変更する
    func setViewColor(_ color:UIColor) {
        baseView?.backgroundColor = color
    }

}
