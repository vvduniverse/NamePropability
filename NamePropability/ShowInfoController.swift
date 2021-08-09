//
//  ShowInfoController.swift
//  NamePropability
//
//  Created by Vahtee Boo on 09.08.2021.
//

import UIKit

class ShowInfoController: UITableViewController {
    
    var nameInfo: NameProbability!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        nameInfo.country?.count ?? 0
        3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...

        return cell
    }
    
}
