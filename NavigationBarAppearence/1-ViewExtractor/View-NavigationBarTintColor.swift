import SwiftUI

extension View {
    func navigationBarTintColor(_ color: UIColor) -> some View {
        self.background(NavigationBarModifier(tintColor: color))
    }
}

struct NavigationBarModifier: UIViewControllerRepresentable {
    let tintColor: UIColor

    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController(tintColor: tintColor)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        DispatchQueue.main.async {
            uiViewController.navigationController?.navigationBar.tintColor = tintColor
        }
    }

    private class ViewController: UIViewController {
        let tintColor: UIColor

        init(tintColor: UIColor) {
            self.tintColor = tintColor
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            DispatchQueue.main.async {
                self.navigationController?.navigationBar.tintColor = self.tintColor
            }
        }
    }
}
