//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var businesses: [Business]!
    
    var filteredData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the search bar programatically since you won't be
        // able to drag one onto the navigation bar
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        
        // the UIViewController comes with a navigationItem property
        // this will automatically be initialized for you if when the
        // view controller is added to a navigation controller's stack
        // you just need to set the titleView to be the search bar
        navigationItem.titleView = searchBar
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
            }
        )
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // When there is no text, filteredData is the same as the original data
//        // When user has entered text into the search box
//        // Use the filter method to iterate over all items in the data array
//        // For each item, return true if the item should be included and false if the
//        // item should NOT be included
//        
//        print("in searhBAR")
//        for item in businesses {
//            
//            filteredData.append(item.name!)
//            print (item.name!)
//        }
//        
//        filteredData = searchText.isEmpty ? filteredData : filteredData.filter({(dataString: String) -> Bool in
//            // If dataItem matches the searchText, return true to include it
//            return dataString.range(of: searchText, options: .caseInsensitive) != nil
//        })
//        
//        tableView.reloadData()
//    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var search = searchText
        if(searchText.isEmpty){
            search = String("Restaurant")
        }
        Business.searchWithTerm(term: search, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.tableView.reloadData()
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
        })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        }else {
            return 0
        }
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
