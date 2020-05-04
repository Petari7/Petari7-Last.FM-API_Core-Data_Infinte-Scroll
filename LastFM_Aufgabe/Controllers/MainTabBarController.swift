
import UIKit
class MainTabBarController: UITabBarController {
    
    
fileprivate let followingView = UIView()
fileprivate var tabBarLeftAnchor: NSLayoutConstraint!
fileprivate var widthAnchor: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       view.backgroundColor = .white
       setupControllers()
       setupFollowingView()
        
        
    NotificationCenter.default.addObserver(self, selector: #selector(handleBadgeValue), name: Notification.Name("Badge"), object: nil)
    }
    
    
@objc func handleBadgeValue() {
        
self.viewControllers?[2].tabBarItem.badgeValue = "*"
        
   
}

    
    
    
    

override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    
    guard let tabbarItem = tabBar.items else { return }
    
    guard let indexPath = tabbarItem.firstIndex(of: item)  else { return }
    
    let constant = CGFloat(indexPath) * tabBar.frame.width / 3 + 24
    
    tabBarLeftAnchor.constant = constant
    
    UIView.animate(withDuration: 0.76, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        
    self.tabBar.layoutIfNeeded()
    })
    
    if indexPath == 2 && self.viewControllers?[2].tabBarItem.badgeValue != nil {
        
        
    self.viewControllers?[2].tabBarItem.badgeValue = nil

    }
    
    
    
}
    
    
    
    
    
    
    
fileprivate func setupControllers() {


let albumsController = CustomNavController(rootViewController: AlbumsController(collectionViewLayout: UICollectionViewFlowLayout()))
let searchController = CustomNavController(rootViewController: SearchController(collectionViewLayout: UICollectionViewFlowLayout()))
let favoritesController = CustomNavController(rootViewController: FavoritesController())


albumsController.tabBarItem.image = #imageLiteral(resourceName: "album copy").withRenderingMode(.alwaysOriginal)
searchController.tabBarItem.image = #imageLiteral(resourceName: "search copy").withRenderingMode(.alwaysOriginal)
favoritesController.tabBarItem.image = #imageLiteral(resourceName: "add") .withRenderingMode(.alwaysOriginal)

viewControllers = [
albumsController,
searchController,
favoritesController
    
]
    
guard let items = tabBar.items else { return }
    
for item in items {
    
item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

    
}

}
    
fileprivate func setupFollowingView() {
    
tabBar.addSubview(followingView)
followingView.backgroundColor = UIColor.init(white: 0.2, alpha: 0.6)
followingView.layer.cornerRadius = 4


followingView.setAnchors(top: nil, bottom: tabBar.safeAreaLayoutGuide.bottomAnchor, left: nil, right: tabBar.rightAnchor, constantTop: 0, constantBottom: -2, constantLeft: 0, constantRight: 0, height: 5, width: 0)
tabBarLeftAnchor = followingView.leftAnchor.constraint(equalTo: tabBar.leftAnchor)
tabBarLeftAnchor.isActive = true
    
widthAnchor = followingView.widthAnchor.constraint(equalTo: tabBar.widthAnchor, multiplier: 1/4)
widthAnchor.isActive = true
    
        

    
}
   
    
    
    
}
