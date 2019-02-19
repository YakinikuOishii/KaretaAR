//
//  ViewController.swift
//  KaretaAR
//
//  Created by 笠原未来 on 2018/11/20.
//  Copyright © 2018 笠原未来. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation

class ViewController: UIViewController, ARSCNViewDelegate{
    
    @IBOutlet var backButton : UIButton!
    @IBOutlet var cameraButton: UIButton!
    
    let appDelegate: AppDelegate! = UIApplication.shared.delegate as! AppDelegate
    
    let songNameArray: [String] = ["最終巻","kranke","neg","u16","kareta","ryuji"]
    var boolArray: [Bool] = [false,false,false,false,false,false]
    
    //音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    
    var playCount: Int! = 0
    
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.setAnimationsEnabled(false)
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //画面下部のやつ
        //        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/GameScene.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ARSessionの設定はviewWillAppear内
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "TEST", bundle: nil) else {
            // failed to read them – crash immediately!
            fatalError("Couldn't load tracking images.")
        }
        configuration.trackingImages = trackingImages
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @IBAction func back() {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func shutter(_ sender: Any) {
        cameraButton.isHidden = true
        backButton.isHidden = true
        //コンテキスト開始
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
        //viewを書き出す
        self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
        // imageにコンテキストの内容を書き出す
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        //コンテキストを閉じる
        UIGraphicsEndImageContext()
        // imageをカメラロールに保存
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        cameraButton.isHidden = false
        backButton.isHidden = false
        print("touched")
    }
    
    
    
    // MARK: - ARSCNViewDelegate
    
    //delegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
//        音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: "Saisyukan_iKareta",ofType:"mp3")!)

        // 再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        print(anchor.name)

        
        let node = SCNNode()

        if let imageAnchor = anchor as? ARImageAnchor {
            
            if anchor.name == "saisyukan" {
                audioPlayer.play()
                
                if appDelegate.boolArray[0] == false{
                    appDelegate.boolArray[0] = true
                    let title = "曲がコレクションされました"
                                    let message = appDelegate.songNameArray[0]
                                    let okText = "OK"
                    
                                    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                                    let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
                                    alert.addAction(okayButton)
                    
                                    present(alert, animated: true, completion: nil)
                }
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 1, alpha: 0.8)
                
                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                
                
                let shipScene = SCNScene(named: "art.scnassets/Record.dae")!
                let shipNode = shipScene.rootNode.childNodes.first!
                shipNode.position = SCNVector3Zero
                shipNode.position.z = 0.15
                
                planeNode.addChildNode(shipNode)
                
                node.addChildNode(planeNode)
                boolArray[0] = true
                
                print(anchor.name)
            }else if anchor.name == "DrKranke" {
                audioPlayer.play()
                
                if appDelegate.boolArray[1] == false{
                    appDelegate.boolArray[1] = true
                    let title = "曲がコレクションされました"
                    let message = appDelegate.songNameArray[1]
                    let okText = "OK"
                    
                    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                    let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okayButton)
                    
                    present(alert, animated: true, completion: nil)
                }

                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 1, alpha: 0.8)
                
                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                
                
                let shipScene = SCNScene(named: "art.scnassets/Record.dae")!
                let shipNode = shipScene.rootNode.childNodes.first!
                shipNode.position = SCNVector3Zero
                shipNode.position.z = 0.15
                
                planeNode.addChildNode(shipNode)
                
                node.addChildNode(planeNode)
                boolArray[1] = true
                
                print(anchor.name)
            }

            
        }else{
            
        }
        return node
    }

}


