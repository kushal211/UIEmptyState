//
//  ViewController.swift
//  UIEmptyStateExample
//
//  Created by Luis Padron on 1/31/17.
//  Copyright © 2017 Luis Padron. All rights reserved.
//

import UIKit
import UIEmptyState

class ViewController: UITableViewController, UIEmptyStateDataSource, UIEmptyStateDelegate {
    var pokemon = ["Charizard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emptyStateDelegate = self
        self.emptyStateDataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell")!
        cell.textLabel?.text = pokemon[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            pokemon.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            self.reloadTableViewEmptyState()
        }
    }
    
    func buttonTitleForEmptyStateView() -> NSAttributedString? {
        return NSAttributedString(string: "Touch me")
    }
    
    func emptyStatebuttonWasTapped(button: UIButton) {
        print("Button touched: \(button)")
    }
    
    func emptyStateViewWasTapped(view: UIView) {
        print("View was touched: \(view)")
    }

    @IBAction func plusTouched(_ sender: Any) {
        // Add a new item
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: pokemon.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
        self.reloadTableViewEmptyState()
    }
}

