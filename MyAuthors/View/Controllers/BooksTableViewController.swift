//
//  BooksTableViewController.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import UIKit

class BooksTableViewController: UITableViewController {

    var books: [Book] = []
    var authorName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: "BooksTableViewCell")
//        tableView.register(UINib(nibName: "BooksTableViewCell", bundle: nil), forCellReuseIdentifier: "BooksTableViewCell")
//        tableView.register(UINib?, forCellReuseIdentifier: "BooksTableViewCell")
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Hello1----------------")
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksTableViewCell.cellIdentifier, for: indexPath) as! BooksTableViewCell
        print("Hello4----------------")

        let model = books[indexPath.row]

        cell.configure(with: BooksCellViewModel(name: model.title, pages: model.pages, release: model.releaseDate))
        
        return cell
    }
}
