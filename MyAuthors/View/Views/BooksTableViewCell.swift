//
//  BooksTableViewCell.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var pages: UILabel!
    @IBOutlet var release: UILabel!
//    @IBOutlet var coverImage: UIImageView!

    static let cellIdentifier = "BooksTableViewCell"
//
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        return UINib(nibName: "BooksTableViewCell", bundle: nil)
    }

    //MARK: configure
    public func configure(with viewModel: BooksCellViewModel) {
        name.text = viewModel.name
        pages.text = String(viewModel.pages)
        release.text = viewModel.release
//        coverImage.image = viewModel.image
    }

}
