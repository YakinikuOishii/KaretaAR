//
//  ProfileViewController.swift
//  KaretaAR
//
//  Created by 笠原未来 on 2019/01/22.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var tabView: UIView!
    
    let appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
    
    let borderColor = UIColor(red: 0.207, green: 0.207, blue: 0.207, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カルーセルの高さ
        let carouselHeight:CGFloat = 200
        
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        profileCarousel = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        profileCarousel.frame = CGRect(x:0, y:32, width:view.frame.size.width, height:carouselHeight)
        profileCarousel.register(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        profileCarousel.backgroundColor = .blue
        profileCarousel.delegate = self as? UICollectionViewDelegate
        profileCarousel.dataSource = self as? UICollectionViewDataSource
        profileCarousel.isPagingEnabled = true // セルが吸着する
        profileCarousel.showsHorizontalScrollIndicator = false
        profileCarousel.tag = 0
        view.addSubview(profileCarousel)
        
        
        
        // タブ的なやつ
        tabView.layer.borderColor = borderColor.cgColor
        tabView.layer.borderWidth = 1.0
        UIView.setAnimationsEnabled(false)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let pageViewRect = self.view.bounds
        return CGSize(width: pageViewRect.width, height: pageViewRect.height-80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        
        switch collectionView.tag
        {
        case 0:
            cell.setViewColor(.cyan)
            break
        
        default:
            break
        }
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // セルタップ時の挙動
        print("僕のタグ番号は\(collectionView.tag)です")
        print("Cellインデックスは\(indexPath.row)です")
        
    }
}
