//
//  AuthorTableViewCell.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel! = {
        let label = UILabel()
        label.text = "Hello".localized()
        return label
    }()
    //static for shared properties and methods
    static let cellIdentifier = "AuthorTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        return UINib(nibName: "AuthorTableViewCell", bundle: nil)
    }

    //MARK: configure
    public func configure(with viewModel: AuthorCellViewModel) {
        name.text = viewModel.name
    }
}

extension String {
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localized", bundle: .main, value: self, comment: self)
    }
}

