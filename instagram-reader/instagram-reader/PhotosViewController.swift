//
//  PhotosViewController.swift
//  instagram-reader
//
//  Created by Ben on 2/6/15.
//  Copyright (c) 2015 Common Sense Labs. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let clientId = "72380f0224754797b459231ca176d817"

    var photos = NSArray()
    @IBOutlet weak var tableView: UITableView!
  
    required init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      // configure tableView
      self.tableView.dataSource = self
      self.tableView.delegate = self
      self.tableView.registerClass(PhotoCell.self, forCellReuseIdentifier: "photoCell")
      
      // fire instagram request
      var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
      var request = NSURLRequest(URL: url)
      NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        self.photos = (responseDictionary["data"] as NSArray)
        
        
        
//        self.tableView.rowHeight = 320
        self.tableView.reloadData()
        
        println("response: \(self.photos)")
      })
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Table View Delegate Methods
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as UITableViewCell
    return cell
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    NSLog("selected  cell \(indexPath.row)")
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
