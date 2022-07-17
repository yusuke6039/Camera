//
//  DrawingViewController.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/07/06.
//
import Firebase
import UIKit

class DrawingViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let preVC = self.presentingViewController as! CameraViewController
        preVC.image = self.imageview.image
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
