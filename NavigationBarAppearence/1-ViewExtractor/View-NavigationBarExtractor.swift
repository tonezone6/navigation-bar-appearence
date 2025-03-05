import SwiftUI

extension View {
    public func navigationAppearence(
        result: @escaping (UINavigationBar?) -> Void
    ) -> some View {
        self.background(NavigationBarExtractor(result: result))
    }
}

struct NavigationBarExtractor: UIViewControllerRepresentable {
    let result: (UINavigationBar?) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        DispatchQueue.main.async {
            if let navigationController = viewController.navigationController {
                result(navigationController.navigationBar)
            }
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
