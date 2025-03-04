import UIKit

extension UINavigationBarAppearance {
    private static let foregroundColor = UIColor(white: 0.2, alpha: 1)
    private static let largeTextFont = UIFont.systemFont(ofSize: 36, weight: .semibold)
    private static let backButtonImage = UIImage(systemName: "arrow.backward")

    static let opaqueWhite: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        
        // Back button
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        
        return appearance
    }()
    
    static let transparent: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor, .font: largeTextFont]
        
        // Back button
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        
        return appearance
    }()
}
