//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Bryant, Jason on 4/9/16.
//  Copyright © 2016 Bryant, Jason. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        print("GOT SIZE")
        
        scrollView.delegate = self
        // Do any additional setup after loading the view.

        
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("SCROLL EVENT")
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        //pageControl.numberOfPages = 4
        //pageControl.currentPageIndicatorTintColor = UIColor.blueColor()
        
        if (page == 3) {
            pageControl.hidden = true
            UIView.animateWithDuration(0.2) {
                self.backupButton.alpha = 1
            }
        } else {
            pageControl.hidden = false
            UIView.animateWithDuration(0.2) {
                self.backupButton.alpha = 0
            }
        }
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
