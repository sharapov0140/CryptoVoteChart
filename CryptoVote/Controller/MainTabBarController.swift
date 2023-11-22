


import UIKit
import Firebase



class MainTabBarController: UITabBarController {
    
    
    

    
 //   let adView = GADBannerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(adView)
//        adView.anchor(top: nil, leading: view.leadingAnchor, bottom: tabBar.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
//
//
        
//        adView.adUnitID = "ca-app-pub-3190301496186495/9517983949"
//        adView.rootViewController = self
//        adView.load(GADRequest())
        
  //      adView.delegate = self
        
        
        
        if #available(iOS 13.0, *) {
        if traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .clear
            view.backgroundColor = UIColor(named: "backgroundColor")
         //   tableView.backgroundColor = UIColor(named: "backgroundColor")
        } else {

        }
        } else {
            print("nochange")
        }

        

        setupTabBar()
       
    }
    

    
    
    func setupTabBar() {
    //    let videoController = createNavController(vc: CryptoList(), selected: star_black, unselected: #imageLiteral(resourceName: "favorite"))
        let listController = createNavController(vc: CryptoList(), selected: #imageLiteral(resourceName: "list"), unselected: #imageLiteral(resourceName: "list"))
        let favoriteController = createNavController(vc: FavoriteCryptoList(), selected: #imageLiteral(resourceName: "icons8-duration-finance-75"), unselected: #imageLiteral(resourceName: "icons8-duration-finance-75"))
        let chatContoller = createNavController(vc: CryptoVote(), selected: #imageLiteral(resourceName: "bars"), unselected: #imageLiteral(resourceName: "bars"))
        let cryptoSettingVC = createNavController(vc: SettingsStackVC(), selected: #imageLiteral(resourceName: "setting_black"), unselected: #imageLiteral(resourceName: "setting_white"))
        
        viewControllers = [listController, favoriteController, chatContoller, cryptoSettingVC]
        
        guard let items = tabBar.items else { return }
        
        guard let tabHome = tabBar.items?[0] else {return}
        tabHome.title = "Crypto List"
        guard let tabPort = tabBar.items?[1] else {return}
        tabPort.title = "Portfolio"
        guard let tabVote = tabBar.items?[2] else {return}
        tabVote.title = "Vote"
        guard let tabSettings = tabBar.items?[3] else {return}
        tabSettings.title = "Settings"
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }}
    

}





extension UITabBarController {
    
    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        UITabBar.appearance().tintColor = UIColor(red: 0.2235, green: 0.5176, blue: 0.4588, alpha: 1.0)
        
        return navController
    }
    
}

//extension MainTabBarController: GADBannerViewDelegate {
//
//    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
//        print("received ad")
//    }
//
//    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
//        print(error)
//    }
//
//}
//
//final class adView: UIView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .orange
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
