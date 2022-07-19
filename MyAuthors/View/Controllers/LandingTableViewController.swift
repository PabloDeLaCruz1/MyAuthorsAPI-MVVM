//
//  LandingTableViewController.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import UIKit

class LandingTableViewController: UITableViewController {
    let parser = DataAPI()
    var authors = [Author]()
    var books = [Book]()
    var authorName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AuthorTableViewCell.nib(), forCellReuseIdentifier: AuthorTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

        //Using our api data object to initialize our data object
        parser.getData {
            data in
            self.authors = data

            //Reload UI on Main thread:
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of Authors"
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return authors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: AuthorTableViewCell.cellIdentifier, for: indexPath) as! AuthorTableViewCell

        let model = authors[indexPath.row]
        cell.configure(with: AuthorCellViewModel(name: model.authorName))

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        books = authors[indexPath.row].books
        authorName = authors[indexPath.row].authorName
        performSegue(withIdentifier: "Show Books", sender: nil)
    }

    // MARK: - Navigation, passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if (segue.identifier == "Show Books") {
            let showBooksViewController: BooksTableViewController = segue.destination as! BooksTableViewController
            showBooksViewController.books = books
            showBooksViewController.authorName = authorName
        }

    }
}

