//
//  AuthorViewModel.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import Foundation

//We use a view model to prevent the need for future changes to our view model, if the Author model has changes that dont relate to our view.
//For example, if the author publishes another book, for our landing view, we do not need to worry about this.
struct AuthorCellViewModel {
    let name: String
}
