//
//  NewsTableViewController.swift
//  News Reader
//
//  Created by Marcin Magiera on 18/02/2020.
//  Copyright © 2020 Marcin Magiera. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var titles:[String] = [
        "Utrudnienia w sercu Oświęcimia",
        "Wiele osób pomagało więźniom KL Auschwitz",
        "Rollercoaster z 90 tysięcy elementów? Tak – FILM, FOTO",
        "Dziki jest ten świat, czyli koncert dla Dzikiego – FILM",
        "Pamiętaj o symbolach formularzy przy wpłatach do skarbówki"
    ]
    
    var authors:[String]=[
        "Redakcja",
        "Redakcja",
        "Redakcja",
        "[link]",
        "Redakcja"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      // Dequeue a table view cell
      var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")

      // If there's no cell, create one
      if cell == nil
      {
          cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier:"cellIdentifier")
      }

      // Set the text and detail text
      cell!.textLabel?.text = titles[indexPath.row]
      cell!.detailTextLabel?.text = authors[indexPath.row]

      return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: nil)

        detailVC.title = titles[indexPath.row]
        detailVC.author = authors[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }

}
