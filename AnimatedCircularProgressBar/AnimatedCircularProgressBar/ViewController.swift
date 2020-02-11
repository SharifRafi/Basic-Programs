import UIKit

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let's start by drawind a circle somehow
        let center = view.center
        
        //create my track layer
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        
        
        //let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.darkGray.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = 0
        
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc private func handleTap(){
        print("Attempting to animate stroke")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        //basicAnimation.fillMode = kCAFillModeForword
        
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }


}

