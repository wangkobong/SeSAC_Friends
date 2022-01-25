//
//  SceneDelegate.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/17.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
//        let vc = UINavigationController(rootViewController: InsertCodeViewController())
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
        let isSignedUp = UserDefaults.standard.bool(forKey: "isSignedUp")

        print("isSignedUp: \(isSignedUp)")
        if Auth.auth().currentUser == nil && !isSignedUp { // 문자인증X && 회원가입X
            let vc = UINavigationController(rootViewController: OnboardingViewController())
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        } else if Auth.auth().currentUser != nil && !isSignedUp { // 문자인증O && 회원가입X
            let vc = UINavigationController(rootViewController: InsertNicknameViewController())
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        } else if Auth.auth().currentUser != nil && isSignedUp { // 문자인증O && 회원가입 O
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            let tabVarVC = UITabBarController()
            let vc1 = UINavigationController(rootViewController: HomeViewController())
            let vc2 = UINavigationController(rootViewController: ShopViewController())
            let vc3 = UINavigationController(rootViewController: FriendViewController())
            let vc4 = UINavigationController(rootViewController: MyInfoViewController())
            tabVarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
            vc1.title = "홈"
            vc2.title = "새싹샵"
            vc3.title = "새싹친구"
            vc4.title = "내정보"
            guard let items = tabVarVC.tabBar.items else {
                return
            }
            let images = ["homeGray", "giftGray", "sesacGray", "homeGray"]

            for x in 0..<items.count {
                items[x].image = UIImage(named: images[x])
            }
            windowScene.windows.first?.rootViewController = tabVarVC
            windowScene.windows.first?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}
