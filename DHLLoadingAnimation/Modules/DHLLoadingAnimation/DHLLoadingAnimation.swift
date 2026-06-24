//
//  DHLLoadingAnimation.swift
//  DHLDHLLoadingAnimation
//
//  Created by Daniel Hernandez on 27/4/26.
//

import Foundation
import UIKit
import Lottie

public class DHLLoadingAnimation: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewWidhtConstraint: NSLayoutConstraint!
    
    public static var widthMultiplier: CGFloat = 0.5
    
    public override init(frame: CGRect) {

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

    public override func awakeFromNib() {

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
         
         var animationView = LottieAnimationView(name: "lottie.json", bundle: Bundle(for: DHLLoadingAnimation.self))
         
         // Si en el Bundle.main hay un archivo llamado "custom_lottie.json", se cargara ese lottie
         if LottieAnimation.named("custom_lottie.json", bundle: Bundle.main) != nil {
             animationView = LottieAnimationView(name: "custom_lottie.json")
         }

         animationView.translatesAutoresizingMaskIntoConstraints = false
         
         containerView.addSubview(animationView)
         
         NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: containerView.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            animationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
         ])
         
         animationView.play(fromProgress: 0, toProgress: 1, loopMode: .loop, completion: nil)
     }
}

extension UIViewController {
    
    public func showLoadingAnimation(show: Bool = true) {
        
        if show {
            // Si la vista no existe, se muestra
            guard !self.view.subviews.contains(where: { $0.isKind(of: DHLLoadingAnimation.self) }) else { return }
            
            let loadingAnimation = DHLLoadingAnimation(frame: .zero)
            loadingAnimation.translatesAutoresizingMaskIntoConstraints = false
            loadingAnimation.alpha = 0
            
            self.view.addSubview(loadingAnimation)
                
            NSLayoutConstraint.activate([
                loadingAnimation.topAnchor.constraint(equalTo: view.topAnchor),
                loadingAnimation.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                loadingAnimation.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                loadingAnimation.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])

            self.view.layoutIfNeeded()
            
            loadingAnimation.containerViewWidhtConstraint.constant = loadingAnimation.bounds.width * DHLLoadingAnimation.widthMultiplier
            
            UIView.animate(withDuration: 0.5) {
                loadingAnimation.alpha = 1
            }
            
        } else {
            // Si la vista existe, se oculta
            if let view = self.view.subviews.first(where: { $0.isKind(of: DHLLoadingAnimation.self) }) {
                
                 UIView.animate(withDuration: 0.5, animations: {
                     view.alpha = 0
                     
                 }) { finished in
                     view.removeFromSuperview()
                 }
            }
        }
    }
}
