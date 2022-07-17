//
//  HomeViewController.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/07/06.
//
import Firebase
import UIKit

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    
    @IBOutlet weak var tableview: UITableView!
    var postarray:[PostData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.titlelabel.text = postarray[indexPath.row].title
        cell.authorlabel.text = postarray[indexPath.row].author
        cell.originallabel.text = postarray[indexPath.row].originalPerson
        var comments = ""
        for comment in postarray[indexPath.row].comments {
                comments += "\(comment)\n"
            }
        cell.commemtlabel.text = comments
//        cell.imageview.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postarray[indexPath.row].id + ".jpg")
        cell.imageview.sd_setImage(with: imageRef)
        return cell
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
