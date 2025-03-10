import SwiftUI

extension View {
    public func navigationBarTintColor(_ color: UIColor) -> some View {
        self.background(BarTintColorModifier(tintColor: color))
    }
}

struct BarTintColorModifier: UIViewControllerRepresentable {
    let tintColor: UIColor

    func makeUIViewController(context: Context) -> UIViewController {
        ViewController(tintColor: tintColor)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    class ViewController: UIViewController {
        let tintColor: UIColor

        init(tintColor: UIColor) {
            self.tintColor = tintColor
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            DispatchQueue.main.async {
                self.updateTintColor()
            }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            DispatchQueue.main.async {
                self.updateTintColor()
            }
        }
        
        func updateTintColor() {
            navigationController?.navigationBar.tintColor = tintColor
        }
    }
}
