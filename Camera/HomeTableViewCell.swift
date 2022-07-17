//
//  HomeTableViewCell.swift
//  Camera
//
//  Created by 新宅雄介 on 2022/07/17.
//
import FirebaseStorageUI
import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var commemtlabel: UILabel!
    @IBOutlet weak var originallabel: UILabel!
    @IBOutlet weak var authorlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
