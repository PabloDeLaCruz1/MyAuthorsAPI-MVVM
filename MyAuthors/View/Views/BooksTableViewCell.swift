//
//  BooksTableViewCell.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pages: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
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
        guard let url = URL(string: viewModel.image!) else { return } 
        coverImage.downloaded(from: url)
        title.text = viewModel.name
        pages.text = String(viewModel.pages)
        releaseDate.text = viewModel.releaseDate
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

