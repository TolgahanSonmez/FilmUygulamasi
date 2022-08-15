//
//  SearchCell.swift
//  FilmUygulamasi
//
//  Created by Opendart Yazılım ve Bilişim Hizmetleri on 22.06.2022.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellName: UILabel!
    
    @IBOutlet weak var cellDate: UILabel!
    
    @IBOutlet weak var cellView: UILabel!
    
    @IBOutlet weak var cellVote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
