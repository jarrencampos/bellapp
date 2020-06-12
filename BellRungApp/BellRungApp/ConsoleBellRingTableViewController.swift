//
//  ConsoleBellRingTableViewController.swift
//  BellRungApp
//
//  Created by Jarren Campos on 6/11/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class ConsoleBellRingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainBellViewController.savedRings.count

    }
    
    //Displays all the cells on load
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "consoleCell", for: indexPath)
                
        let ring = MainBellViewController.savedRings[indexPath.row]
        cell.textLabel?.text = ring.name
        
        return cell
    }

}
