//
//  DHLLoadingAnimation.swift
//  DHLDHLLoadingAnimation
//
//  Created by Daniel Hernandez on 27/4/26.
//

import Foundation
import UIKit

class DHLLoadingAnimation: UIView {

    @IBOutlet weak var containerView: UIView!

    override init(frame: CGRect) {

        super.init(frame: frame)
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        nibSetup()
    }

    private func nibSetup() {

        backgroundColor = .clear

        let bundle = Bundle(for: DHLLoadingAnimation.self)
        
        if let xibView = bundle.loadNibNamed("DHLLoadingAnimation", owner: self, options: nil)?.first as? UIView {

            xibView.frame = self.bounds
            xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(xibView)

            commonInit()
        }
    }

    override func awakeFromNib() {

        super.awakeFromNib()

        commonInit()
    }

    func commonInit() {
        
        setUpAccessiblity()
        setUpViews()
    }
    
    private func setUpAccessiblity() {
        
        self.accessibilityViewIsModal = true

    }
     
     private func setUpViews() {
         
         containerView.layer.cornerRadius = 8

     }

    func setUp() {
        
    }
}
