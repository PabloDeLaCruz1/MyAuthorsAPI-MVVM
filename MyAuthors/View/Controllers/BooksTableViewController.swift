//
//  BooksTableViewController.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import UIKit

class BooksTableViewController: UITableViewController {

    var books = [Book]()
    var authorName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(BooksTableViewCell.nib(), forCellReuseIdentifier: BooksTableViewCell.cellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return authorName
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return books.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: BooksTableViewCell.cellIdentifier, for: indexPath) as? BooksTableViewCell else {
            fatalError("failed on \(indexPath)") }

        let model = books[indexPath.row]
        cell.configure(with: BooksCellViewModel(image: model.coverImage, name: model.title, pages: model.pages, releaseDate: model.releaseDate))

        cell.pagesLb.text = "Pages:".localized()
        cell.releaseLb.text = "Release:".localized()

        return cell
    }
}
