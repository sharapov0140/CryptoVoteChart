//
//  CoinDetailsViewController.swift
//  Coins PUI
//
//  Created by ZAF on 5/26/19.
//  Copyright © 2019 Muzaffar Sharapov. All rights reserved.
//

import Foundation
import UIKit



class CoinDetailsViewController: UIViewController {
    
    
    
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let label = UIActivityIndicatorView(style: .whiteLarge)
     //   label.backgroundColor = .yellow
        label.startAnimating()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    
    lazy var changeLabel: UILabel = {
        let label = UILabel()
      //  label.backgroundColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        
       
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var changeLabelFake: UILabel = {
        let label = UILabel()
      //  label.text = "fake"
        label.backgroundColor = UIColor(named: "backgroundColor")
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    lazy var noDataLabel: UILabel = {
        let label = UILabel()
      //  label.backgroundColor = .red

        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 500
       // view.backgroundColor = UIColor.white
        
        return view
    }()
    
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
      
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "Price:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var priceLabelJSON: UILabel = {
        let label = UILabel()
    //    label.backgroundColor = .purple

        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var marketCapLabel: UILabel = {
        let label = UILabel()
   //     label.backgroundColor = .purple
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "MCAP:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var marketCapLabelJSON: UILabel = {
        let label = UILabel()
    //    label.backgroundColor = .purple
        
       label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    

    lazy var percetnChng24hLb: UILabel = {
        let label = UILabel()
     //   label.backgroundColor = .purple
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "% Change(24h):"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var percetnChng24hLbJSON: UILabel = {
        let label = UILabel()
     //   label.backgroundColor = .purple
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var volumeLb: UILabel = {
        let label = UILabel()
   //     label.backgroundColor = .purple
        label.textColor = .gray
       label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "Volume(24h):"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var volumeLbJSON: UILabel = {
        let label = UILabel()
     //   label.backgroundColor = .purple
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var maxSupplyLb: UILabel = {
        let label = UILabel()
    //    label.backgroundColor = .purple
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "Max Supply:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var maxSupplyLbJSON: UILabel = {
        let label = UILabel()
     //   label.backgroundColor = .purple
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var changePercent24HrStringLb: UILabel = {
        let label = UILabel()
   //     label.backgroundColor = .purple
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "Change price % (24h):"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var changePercent24HrStringLbJSON: UILabel = {
        let label = UILabel()
    //    label.backgroundColor = .purple
        
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var supplyLb: UILabel = {
        let label = UILabel()
   //     label.backgroundColor = .purple
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "Supply:"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var supplyLbJSON: UILabel = {
        let label = UILabel()
   //     label.backgroundColor = .purple
        label.font = UIFont.boldSystemFont(ofSize: 15)
     //   label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "No Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func configureViewComponents() {
        
        view.addSubview(scrollView)
        view.addSubview(changeLabelFake)
        view.addSubview(changeLabel)
        
        view.addSubview(chartView)
        chartView.addSubview(activityIndicator)
        //noDataView.addSubview(noDataLabel)
        chartView.addSubview(noDataView)
      //  view.backgroundColor = .white
        
        //     chartView.delegate = self
        
        animation.duration = 0.2
        animation.type = CATransitionType.fade
        navigationItem.title = crypto?.symbol
        
        
        navigationController?.navigationBar.isTranslucent = false
       // view.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        noDataView.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        changeLabelFake.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                       leading: view.leadingAnchor,
                                       bottom: changeLabel.topAnchor,
                                       trailing: view.trailingAnchor,
                                       paddingTop: 10, // example padding
                                       paddingLeft: 10,
                                       paddingBottom: 0,
                                       paddingRight: 10)

//                let insets = view.safeAreaInsets
//                print("Top inset: \(insets.top)")
//                print("Bottom inset: \(insets.bottom)")
//                print("Left inset: \(insets.left)")
//                print("Right inset: \(insets.right)")
        
//       changeLabelFake.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: changeLabel.topAnchor, trailing: view.trailingAnchor, padding: .init(top: -13, left: 0, bottom: 0, right: 0), size: .init(width: (view.frame.width-32), height: 13))
//
        changeLabel.anchor(top: changeLabelFake.bottomAnchor, leading: view.leadingAnchor, bottom: chartView.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: (view.frame.width)/3, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        chartView.anchor(top: changeLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: (view.frame.height)/2) )
        
        
//        noDataView.anchor(top: chartView.topAnchor, leading: chartView.leadingAnchor, bottom: chartView.bottomAnchor, trailing: chartView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 25, height: 5))
//
//        noDataLabel.anchor(top: noDataView.topAnchor, leading: noDataView.leadingAnchor, bottom: noDataView.bottomAnchor, trailing: noDataView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 20, height: 4))
        
        activityIndicator.anchor(top: chartView.topAnchor, leading: chartView.leadingAnchor, bottom: chartView.bottomAnchor, trailing: chartView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 10, height: 0))
        
        view.addSubview(segmentedControl)
        segmentedControl.anchor(top: chartView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 1, left: 2, bottom: 0, right: 2), size: .init(width: view.frame.width, height: 30))
        
        scrollView.anchor(top: segmentedControl.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: 500))
        
        
        scrollView.addSubview(priceLabel)
        priceLabel.anchor(top: scrollView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 30, left: 40, bottom: 0, right: 40))
        scrollView.addSubview(priceLabelJSON)
        priceLabelJSON.anchor(top: scrollView.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding:  .init(top: 30, left: 0, bottom: 0, right: 40))
        scrollView.addSubview(volumeLb)
        volumeLb.anchor(top: priceLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
        scrollView.addSubview(volumeLbJSON)
        volumeLbJSON.anchor(top: priceLabelJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
        
        
        
        scrollView.addSubview(changePercent24HrStringLb)
        changePercent24HrStringLb.anchor(top: volumeLb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
        scrollView.addSubview(changePercent24HrStringLbJSON)
        changePercent24HrStringLbJSON.anchor(top: volumeLbJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
        
        
        scrollView.addSubview(marketCapLabel)
        marketCapLabel.anchor(top: changePercent24HrStringLb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
        scrollView.addSubview(marketCapLabelJSON)
        marketCapLabelJSON.anchor(top: changePercent24HrStringLbJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding:  .init(top: 10, left: 0, bottom: 0, right: 40))
        
        
        scrollView.addSubview(maxSupplyLb)
        maxSupplyLb.anchor(top: marketCapLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
        scrollView.addSubview(maxSupplyLbJSON)
        maxSupplyLbJSON.anchor(top: marketCapLabelJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding:  .init(top: 10, left: 0, bottom: 0, right: 40))
        
        
        scrollView.addSubview(supplyLb)
        supplyLb.anchor(top: maxSupplyLb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 10, left: 40, bottom: 0, right: 40))
        scrollView.addSubview(supplyLbJSON)
        supplyLbJSON.anchor(top: maxSupplyLbJSON.bottomAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 40))
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isTranslucent = false
//            self.navigationController?.navigationBar.barTintColor = .white
//            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            self.navigationController?.navigationBar.shadowImage = UIImage()
        
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .clear
            view.backgroundColor = UIColor(named: "backgroundColor")
         //   tableView.backgroundColor = UIColor(named: "backgroundColor")
        } else {

           view.backgroundColor = UIColor(named: "backgroundColor")
        }
        } else {
           view.backgroundColor = UIColor(named: "backgroundColor")
        }
        requestData(for: .hour)
        
        segmentedControl.addTarget(self, action: #selector(CoinDetailsViewController.changeChartType(_:)), for: .valueChanged)
        segmentedControl.selectedIndex = 0
        configureViewComponents()
        scrollViewData()
        transitioningDelegate = self
        
    }
    
    
    
//    private var asset: Asset?
    private let animation = CATransition()
    private let feedBackGenerator = UIImpactFeedbackGenerator()
    var originFrame = CGRect.zero
    var crypto: cryptoCoinCapJsonPeriod?
//    var votedCrypto: Post?
    var symbol: String?
    let chartView = ChartView()
    let segmentedControl = SegmentedControl()
    let noDataView = NoDataView()
    
    
    
    
    
    
    func scrollViewData() {
        
        
        if let marketCap = crypto?.marketCapUsd {
            let marketCapString = Double(marketCap)!
            marketCapLabelJSON.text = doubleToMoneyString(double: marketCapString)
        }
        
        
        
        if let price = crypto?.priceUsd {
            let priceString = Double(price)!
            let pric = doubleToMoneyString(double: priceString)
            priceLabelJSON.text = pric
        }
        
        if let volume = crypto?.volumeUsd24Hr {
            let volumeString = Double(volume)!
            volumeLbJSON.text = doubleToMoneyString(double: volumeString)
        }
        
        
        
        
        
        
        if let changePercent24Hr = crypto?.changePercent24Hr  {
        let changePercent24HrString = Double(changePercent24Hr)!
             changePercent24HrStringLbJSON.text = "\(round(100*changePercent24HrString)/100)%"
            
        }
        
        guard let symbol = crypto?.symbol else {return}
        
        
        if let maxSupply = crypto?.maxSupply {
            let maxSupplyString = Double(maxSupply)!
           
            let supp = commaInNumber(double: maxSupplyString)
            maxSupplyLbJSON.text = "\(supp) \(symbol)"
            
        }
        
        
        if let supply = crypto?.supply {
            let supplySting = Double(supply)!
            let supp = commaInNumber(double: supplySting)
            supplyLbJSON.text = "\(supp) \(symbol)"
        }
        
        
        
        
        
        
        
        
        
        
      //  volumeLbJSON.text = "$\(Double(round(10 * volume)/10))"
        
        
        
       
        
        
        
    }
    
    func commaInNumber(double: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let formattedNumber = numberFormatter.string(from: NSNumber(value:double)) {
            return formattedNumber
        } else {
            return "ERROR"
        }
        
    }
    
    func doubleToMoneyString(double: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        
        if let fancyPrice = formatter.string(from: NSNumber(floatLiteral: double)) {
            return fancyPrice
        } else {
            return "ERROR"
        }
    }
    
    
    
    
    
    
    
    @objc func changeChartType(_ sender: SegmentedControl) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        noDataView.isHidden = true
//        print(sender.selectedIndex)
        switch sender.selectedIndex {
        case 0: requestData(for: .hour)
        case 1: requestData(for: .day)
        case 2: requestData(for: .week)
        case 3: requestData(for: .month)
        case 4: requestData(for: .halfYear)
        case 5: requestData(for: .year)
        case 6: requestData(for: .all)
        default: break
        }
    }
    
    
    
    

    
    
    private func requestData(for type: API.EndPoint.ChartType) {
        
        
        guard let symbol = crypto?.symbol else { return }
        

        API.requestChartData(type: type, for: symbol,
                             success: { [weak self] chartData in
            guard let slf = self else { return }
                    slf.chartView.layer.add(slf.animation, forKey: kCATransition)

                    // Adjusting the mapping to create an array of tuples
                    slf.chartView.data = chartData.Data.map { (value: $0.low, timestamp: $0.time) }

                    slf.activityIndicator.stopAnimating()
                    slf.activityIndicator.isHidden = true
                    slf.noDataView.isHidden = true

                    let pricesL = chartData.Data.map { $0.low }
                    let pricesH = chartData.Data.map { $0.high }
                    let pricesO = chartData.Data.map { $0.open }
                    let pricesC = chartData.Data.map { $0.close }
                                
                                
                    let times = chartData.Data.map { $0.time }
                                
                                Formatter.formatProfit(label: slf.changeLabel,
                                                       firstValue: pricesL[0],
                                                       lastValue: pricesL[pricesL.count - 2],
                                                       maximumFractionDigits: 5)
            },
                             failure: { [weak self] error in
                                guard let slf = self else { return }
                                slf.activityIndicator.stopAnimating()
                                slf.activityIndicator.isHidden = true
                                slf.noDataView.isHidden = false
                                //       slf.showErrorAlert(error)
        })
    }

    
    
    
    
    
}


extension CoinDetailsViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            return CustomViewControllerAnimator(duration: 0.2, isPresenting: true, originFrame: originFrame)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomViewControllerAnimator(duration: 0.2, isPresenting: false, originFrame: originFrame)
    }
    
    
}




final class CustomViewControllerAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration : TimeInterval
    var isPresenting : Bool
    var originFrame : CGRect
    
    init(duration : TimeInterval, isPresenting : Bool, originFrame : CGRect) {
        self.duration = duration
        self.isPresenting = isPresenting
        self.originFrame = originFrame
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let snapshot = isPresenting ? toVC.view.snapshotView(afterScreenUpdates: true) : fromVC.view.snapshotView(afterScreenUpdates: false)
            else { return }
        
        let containerView = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        snapshot.frame = isPresenting ? originFrame : finalFrame
        snapshot.alpha = isPresenting ? 0.0 : 1.0
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        
        if isPresenting { toVC.view.isHidden = true }
        
        UIView.animate(
            withDuration: self.duration,
            animations: {
                snapshot.frame = self.isPresenting ? finalFrame : self.originFrame
                snapshot.alpha = self.isPresenting ? 1.0 : 0.0
        },
            completion: { _ in
                if self.isPresenting { toVC.view.isHidden = false }
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
}




final class NoDataView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }()
    
    var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
    }
}
