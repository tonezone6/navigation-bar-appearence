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

    public static let opaque: UINavigationBarAppearance = {
        let appearance: UINavigationBarAppearance = .opaqueBackground(color: .white)
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.setBackButtonImage(systemName: "arrow.backward")
        appearance.hideBackButtonTitle()
        return appearance
    }()
    
    public static let transparent: UINavigationBarAppearance = {
        let appearance: UINavigationBarAppearance = .transparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: foregroundColor,
            .font: UIFont.systemFont(ofSize: 36, weight: .semibold)
        ]
        appearance.setBackButtonImage(systemName: "arrow.backward")
        appearance.hideBackButtonTitle()
        return appearance
    }()
}

private extension UINavigationBarAppearance {
    static func opaqueBackground(color: UIColor) -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        return appearance
    }
    
    static func transparentBackground() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        return appearance
    }
    
    func setBackButtonImage(systemName: String) {
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        let image = UIImage(systemName: systemName, withConfiguration: config)
        setBackIndicatorImage(image, transitionMaskImage: image)
    }
    
    func hideBackButtonTitle() {
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        self.backButtonAppearance = buttonAppearance
    }
}
