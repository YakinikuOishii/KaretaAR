//
//  MusicViewController.swift
//  KaretaAR
//
//  Created by 笠原未来 on 2019/01/22.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet var tabView: UIView!
    let borderColor = UIColor(red: 0.207, green: 0.207, blue: 0.207, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
