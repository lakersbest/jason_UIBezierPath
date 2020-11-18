
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        loadingIndicator.isAnimating = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.loadingIndicator.isAnimating = false
            self.helloLabel.isHidden = false
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(helloLabel)
        self.view.addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            helloLabel.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor
                .constraint(equalTo: self.view.centerXAnchor),
            loadingIndicator.centerYAnchor
                .constraint(equalTo: self.view.centerYAnchor),
            loadingIndicator.widthAnchor
                .constraint(equalToConstant: 60),
            loadingIndicator.heightAnchor
                .constraint(equalTo: self.loadingIndicator.widthAnchor)
        ])
    }
    let loadingIndicator: ProgressView = {
        let progress = ProgressView(colors: [.orange, .blue, .red], lineWidth: 6)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "彼得潘是最帥的老師!"
        label.font = .systemFont(ofSize: 35)
        //label.textColor = GREEN
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
