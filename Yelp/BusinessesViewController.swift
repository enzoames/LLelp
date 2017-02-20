//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MBProgressHUD

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var searchBar: UISearchBar!
    var businesses: [Business]!
    var searchSettings = BusinessSearchSettings()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        searchBar.sizeToFit()
        
        navigationItem.titleView = searchBar
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Business.searchWithTerm(term: "Thai", completion:
        { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            
            self.tableView.reloadData()
            
            if let businesses = businesses
            {
                for business in businesses
                {
                    print(business.name!)
                    print(business.address!)
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        })
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    func doSearch(str: String)
    {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        Business.searchWithTerm(term: str, completion:
            { (businesses: [Business]?, error: Error?) -> Void in
                
                self.businesses = businesses
                
                self.tableView.reloadData()
                
                if let businesses = businesses
                {
                    for business in businesses
                    {
                        print(business.name!)
                        print(business.address!)
                    }
                }
                MBProgressHUD.hide(for: self.view, animated: true)
     
        })
        
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if businesses != nil
        {
            return businesses!.count
        }
        else
        {
            return 0
        }
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

// SearchBar methods
extension BusinessesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch(str: searchSettings.searchString!)
    }
}
















