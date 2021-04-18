//
//  UserItemTableViewCell.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 18/04/21.
//

import UIKit

class UserItemTableViewCell: UITableViewCell {

    @IBOutlet weak var codeValueLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUser(user: User){
        codeValueLabel.text = user.code
        nameValueLabel.text = "\(user.name) \(user.lastName)"
        emailValueLabel.text = user.email
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
