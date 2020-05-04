
import UIKit
import CoreData

let rootViewController =  MainTabBarController()



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = rootViewController
        
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().barTintColor = .darkBlue
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

  


    
    
        
        return true
    }

   

}

