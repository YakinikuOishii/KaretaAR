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
    
    var carouselView:ProfileCarouselView!
    
    let appDelegate: AppDelegate! = UIApplication.shared.delegate as? AppDelegate
    
    let borderColor = UIColor(red: 0.207, green: 0.207, blue: 0.207, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        carouselView = ProfileCarouselView(frame: CGRect(x:0, y:0, width:width, height:609))
        carouselView.center = CGPoint(x:width / 2,y: height / 2)
        self.view.addSubview(carouselView)
        self.view.sendSubviewToBack(carouselView)
        
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
