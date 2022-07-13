//
//  CameraViewController.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/07/06.
//

import UIKit

class CameraViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var pictureimage: UIImageView!
    
    @IBAction func post(_ sender: Any) {
    }
    @IBAction func cameraButtonAction(_ sender: Any) {
//    カメラが利用可能かチェック
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
        print("カメラは利用できます")
//        （１）UIImagePickerControllerのインスタンスを作成
        let imagePickerController = UIImagePickerController()
//        （２）sourceTypeにcameraを設定
        imagePickerController.sourceType = .camera
//        （３）delegate設定
        imagePickerController.delegate = self
//        （４）モーダルビューで表示
        present(imagePickerController, animated: true, completion: nil)
    } else {
        print("カメラは利用できません")
    }
}
    @IBAction func shareButtonAction(_ sender: Any) {
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
