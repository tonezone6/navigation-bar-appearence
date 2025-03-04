import SwiftUI

struct NavigationView<Content, Destination, DestinationContent>: UIViewControllerRepresentable
where Content: View, Destination: Hashable, DestinationContent: View {
    
    let rootView: Content
    @Binding var destinationPath: [Destination]
    let destination: (Destination) -> DestinationContent
    let appearence: ((UINavigationBar) -> Void)?
    
    init(
        rootView: Content,
        destinationPath: Binding<[Destination]>,
        destination: @escaping (Destination) -> DestinationContent,
        appearence: ((UINavigationBar) -> Void)? = nil
    ) {
        self.rootView = rootView
        self._destinationPath = destinationPath
        self.destination = destination
        self.appearence = appearence
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let rootViewController = UIHostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        context.coordinator.navigationController = navigationController
        navigationController.delegate = context.coordinator
        
        appearence?(navigationController.navigationBar)
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        let currentCount = uiViewController.viewControllers.count
        let targetCount = destinationPath.count + 1 // because root is not in destinationPath
        
        // Swiped back or tapped back button
        context.coordinator.didNavigateBack = {
            if !destinationPath.isEmpty {
                DispatchQueue.main.async {
                    destinationPath.removeLast()
                }
            }
        }
        
        // Added a new destination
        if targetCount > currentCount, let destination = destinationPath.last {
            context.coordinator.push(destination)
        }
        
        // Removed last destination
        if targetCount < currentCount, !destinationPath.isEmpty {
            DispatchQueue.main.async {
                destinationPath.removeLast()
            }
        }

        // Removed all destinations
        if destinationPath.isEmpty, currentCount > 1 {
            context.coordinator.popToRoot()
        }
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate {
        var parent: NavigationView
        weak var navigationController: UINavigationController?
        var didNavigateBack: (() -> Void)? // swipe back or back button tapped
        
        init(parent: NavigationView) {
            self.parent = parent
        }
        
        func push(_ destination: Destination) {
            guard let navigationController = navigationController else { return }
            let destinationView = parent.destination(destination)
            let viewController = UIHostingController(rootView: destinationView)
            navigationController.pushViewController(viewController, animated: true)
        }
        
        func popToRoot() {
            if let navigationController {
                navigationController.popToRootViewController(animated: true)
            }
        }
        
        func navigationController(
            _ navigationController: UINavigationController,
            willShow viewController: UIViewController,
            animated: Bool
        ) {
            if let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from),
               !navigationController.viewControllers.contains(fromVC) {
                DispatchQueue.main.async {
                    self.didNavigateBack?()
                }
            }
        }
    }
}
