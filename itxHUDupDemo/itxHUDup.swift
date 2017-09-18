//
//  itxHUDup.swift
//  itxHUDupDemo
//
//  Created by Alen Palamar on 30.08.17.
//  Copyright © 2017 itxpalamar.eu. All rights reserved.
//

import Foundation
import UIKit

open class itxHUDup : UIViewController {
    
    static var myself:itxHUDup?
    
    @IBOutlet weak var loadContainer: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblProzessDef: UILabel!
    
    var images:[String] = []
    var titleProcess: String!
    var timer = Timer()
    var photoCount:Int = 0
    var timeint:Double = 0.0
    
    func initHUDup(_ hud: itxHUDup){
        lblProzessDef.text = "Keep Cool"
        images = ["0","1","2","3","4","5"]
        imgView.image = UIImage(named: images[0])
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTransition), userInfo: nil, repeats: true)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        if itxHUDup.myself != nil {
            self.initHUDup(itxHUDup.myself!)
        }
    }
    
    //Constructor Myself
    class func MYSELF(_ _myself:itxHUDup?) {
        myself = _myself
    }

    //Factory Pattern
    class func StartXProgressHUD() {
        MYSELF(self.make(.progress))
    }
    
    open class func showProgress() {
        StartXProgressHUD()
        itxHUDup.myself?.showHUD()
    }
    
    func onTransition() {
        if (photoCount < images.count - 1){
            photoCount = photoCount  + 1;
        }
        else {
            photoCount = 0;
        }
        
        UIView.transition(with: self.imgView, duration: 2.0, options: .transitionCrossDissolve, animations: {
            self.imgView.image = UIImage.init(named: self.images[self.photoCount])
        }, completion: nil)
    }
    
    //MARK: Show/hide and timer
    fileprivate func showHUD() {
        itxHUDup.myself?.view.alpha = 0.5;
        if let keywindow = UIApplication.shared.windows.last {
            keywindow.addSubview(self.view)
            UIView.animate(withDuration: 1.55, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: UIViewAnimationOptions(), animations: { () -> Void in
                itxHUDup.myself?.view.alpha = 1;
            }) { (finished) -> Void in
            }
        }
    }
    
    open class func dismiss() {
        if let _myself = myself {
            UIView.animate(withDuration: 0.45, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
                _myself.view.alpha = 0;
            }) { (finished) -> Void in
                _myself.view.removeFromSuperview()
            }
        }
    }
    open static func hideAfter(_ delay: TimeInterval) {
        itxHUDup.myself?.hide(afterDelay: delay)
    }
    
    class func make(_ type : itxSceneType) -> itxHUDup? {
        let itxHUDupStoryBoard: UIStoryboard = UIStoryboard(name: "itXHUDup", bundle: Bundle(for: itxHUDup.self))
        switch type {
        case .progress:
            return itxHUDupStoryBoard.instantiateViewController(withIdentifier: itxStoryBoardID.progress) as? itxHUDup
  
        }
    }
    
    fileprivate var hideTimer: Timer?
    fileprivate func hide(afterDelay delay: TimeInterval) {
        hideTimer?.invalidate()
        hideTimer = Timer.scheduledTimer(timeInterval: delay, target: self.classForCoder, selector: #selector(itxHUDup.dismiss), userInfo: nil, repeats: false)
    }
    
}


struct itxStoryBoardID {
    static let progress = "progress"
    //static let success = "success"
    //static let failure = "failure"
}

enum itxSceneType {
    case progress//,success,failure
}




