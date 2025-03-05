import SwiftUI

extension View {
    func extractView(result: @escaping (UIView) -> ()) -> some View {
        self.background(ViewExtractor(result: result))
    }
    
    func navigationAppearence(
        result: @escaping (UINavigationBar?) -> Void
    ) -> some View {
        self.background(NavigationBarExtractor(result: result))
    }
}

struct ViewExtractor: UIViewRepresentable {
    let result: (UIView) -> ()
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        
        DispatchQueue.main.async {
            if let uiView = view.superview?.superview?.subviews.last?.subviews.first {
                result(uiView)
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
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
