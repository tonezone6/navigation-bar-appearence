import UIKit

extension UINavigationBarAppearance {
    static let foregroundColor = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .light:
            UIColor(white: 0.2, alpha: 1)
        default:
            UIColor(white: 0.8, alpha: 1)
        }
    }

    static let customOpaque: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        
        // Back button
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: config)
            //.withTintColor(foregroundColor, renderingMode: .alwaysTemplate)
        
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        
        return appearance
    }()
    
    static let customTransparent: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: foregroundColor,
            .font: UIFont.systemFont(ofSize: 36, weight: .semibold)
        ]
        
        // Back button
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: config)
            //.withTintColor(foregroundColor, renderingMode: .alwaysTemplate)

        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        
        return appearance
    }()
}
