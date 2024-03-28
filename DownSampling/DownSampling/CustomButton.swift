//
//  CustomButton.swift
//  DownSampling
//
//  Created by 권오준 on 2024-03-28.
//

import UIKit

class CustomButton: UIButton {
    
    // MARK: Properties
    
    private var fetchOption: FetchOptions
    
    // MARK: Init
    
    init(fetchOption: FetchOptions) {
        self.fetchOption = fetchOption
        super.init(frame: .zero)
        
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    private func configureButton() {
        let attributedStr = NSAttributedString(
            string: fetchOption.rawValue,
            attributes: [ .font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        )
        
        configuration = UIButton.Configuration.filled()
        configuration?.baseBackgroundColor = .gray
        configuration?.cornerStyle = .capsule
        configuration?.attributedTitle = AttributedString(attributedStr)
    }
    
    // MARK: Functions
    
    func getFetchOption() -> FetchOptions {
        return fetchOption
    }
    
}
