
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewController = FeedViewController()
        let logInViewController = LogInViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        
        let feedImage = UIImage(systemName: "house.fill", withConfiguration: boldConfig)!
        let loginImage = UIImage(systemName: "person.fill", withConfiguration: boldConfig)!
        
        viewControllers = [
            makeNavigationController(rootViewController: feedViewController, title: "Feed", image: feedImage),
            makeNavigationController(rootViewController: logInViewController, title: "Profile", image: loginImage)
        ]
    }
    
    private func makeNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.title = title
        navigationViewController.tabBarItem.image = image
        return navigationViewController
    }
}
