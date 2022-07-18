//
//  DataAPI.swift
//  MyAuthors
//
//  Created by Pablo De La Cruz on 7/13/22.
//

import Foundation


struct DataAPI {
    //escaping to make the closure escape, since swift makes them nonescaping by default
    //because the closure passed as completion handler is executed once the request completes, which is some time after the data task is created. Meaning the closure will outlive the func scope.
    //Async process,
    func getData(comp: @escaping ([Author]) -> ()) {
        guard let apiUrl = URL(string: "https://mocki.io/v1/e860a172-2605-4afe-bcba-dfd071e8256e") else { return }

        URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            guard let data = data else {
//                print(error?.localizedDescription)
                return
            }
            do {
                let result = try JSONDecoder().decode([Author].self, from: data)
                
                //Rows of the author list should be sorted by name
                //Pass sorted results to completion handler:
                comp(result.sorted { $0.authorName < $1.authorName })
            } catch {
                //Print out proper errors for easy debugging:
                print("errors trying to decode", error)
            }
        }.resume()
    }
    
}

