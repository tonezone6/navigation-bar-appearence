import SwiftUI

extension View {
    public func navigationBackButtonMinimal() -> some View {
        self.background(NavigationItemExtractor { navigationItem in
            navigationItem?.backButtonDisplayMode = .minimal
        })
    }
    
    public func navigationItem(result: @escaping (UINavigationItem?) -> Void) -> some View {
        self.background(NavigationItemExtractor(result: result))
    }
}

struct NavigationItemExtractor: UIViewControllerRepresentable {
    let result: (UINavigationItem?) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ViewController(result: result)
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    
    class ViewController: UIViewController {
        let result: (UINavigationItem?) -> Void

        init(result: @escaping (UINavigationItem?) -> Void) {
            self.result = result
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            result(parent?.navigationItem)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            result(parent?.navigationItem)
        }
    }
}
