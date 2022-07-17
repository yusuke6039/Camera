//
//  ViewController.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/06/23.
//
import Firebase
import UIKit

class InputLetterBodyViewController: UIViewController {
    @IBOutlet weak var originalTextview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let preVC = self.presentingViewController as! CameraViewController
        preVC.original = self.originalTextview.text
    }
    
}

