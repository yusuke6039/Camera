//
//  CameraViewController.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/07/06.
//
import Firebase
import UIKit

class CameraViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    @IBOutlet weak var titleField: UITextField!
    
    
    @IBOutlet weak var genre: UITextField!
    @IBOutlet weak var imageview: UIImageView!
    var original = ""
    var image:UIImage!
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
        // 画像をJPEG形式に変換する
        let imageData = imageview.image!.jpegData(compressionQuality: 0.75)
            // 画像と投稿データの保存場所を定義する
            let postRef = Firestore.firestore().collection(Const.PostPath).document()
            let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postRef.documentID + ".jpg")
        let drawImageData = image.jpegData(compressionQuality: 0.75)
            // 画像と投稿データの保存場所を定義する
            let drawImageRef = Firestore.firestore().collection(Const.PostPath).document()
            let drawRef = Storage.storage().reference().child(Const.ImagePath).child(drawImageRef.documentID + ".jpg")
        // Storageに画像をアップロードする
           let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            imageRef.putData(imageData!, metadata: metadata) { (metadata, error) in
                if error != nil {
                    // 画像のアップロード失敗
                    print(error!)
//                    SVProgressHUD.showError(withStatus: "画像のアップロードが失敗しました")
                    // 投稿処理をキャンセルし、先頭画面に戻る
                    UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
                    return
                }
                // FireStoreに投稿データを保存する
                let name = Auth.auth().currentUser?.displayName
                let postDic = [
                    "title": self.titleField.text!,
                    "genre": self.genre.text!,
                    "original": self.original,
                    "author": name!,
                    "originalPerson": name!,
                    "date": FieldValue.serverTimestamp(),
                    ] as [String : Any]
                postRef.setData(postDic)
                // HUDで投稿完了を表示する
//                SVProgressHUD.showSuccess(withStatus: "投稿しました")
                // 投稿処理が完了したので先頭画面に戻る
                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        drawRef.putData(drawImageData!, metadata: metadata) { (metadata, error) in
            if error != nil {
                // 画像のアップロード失敗
                print(error!)
//                    SVProgressHUD.showError(withStatus: "画像のアップロードが失敗しました")
                // 投稿処理をキャンセルし、先頭画面に戻る
                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
                return
            }
            
            // 投稿処理が完了したので先頭画面に戻る
            UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        }
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
