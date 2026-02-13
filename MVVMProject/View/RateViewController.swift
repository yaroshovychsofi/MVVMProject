//
//  RateViewController.swift
//  MVVMProject
//
//  Created by Софія Ярошович on 13.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import UIKit
import SnapKit

final class RateViewController: UIViewController {
    
    private let viewModel: RateViewModel

    private var loader = UIActivityIndicatorView(style: .medium)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Rate"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()

    private let getRateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Current Rate", for: .normal)
        return button
    }()

    init(viewModel: RateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Requried initializer has not been implemented")
    }

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(getRateButton)
        view.addSubview(loader)

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        getRateButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        loader.snp.makeConstraints { make in
            make.leading.equalTo(getRateButton.snp.trailing).offset(10)
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.centerY.equalTo(getRateButton.snp.centerY)
        }
    }

    @objc private func getRate() {
        viewModel.fetchRate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        bindVM()
        getRateButton.addTarget(self, action: #selector(getRate), for: .touchUpInside)
    }

    private func bindVM() {
        viewModel.onUpdate = { [weak self] result in
            self?.titleLabel.text = "Current Rate: \(result)"
        }
        viewModel.onLoading = { [weak self] isLoading in
            self?.getRateButton.isEnabled = !isLoading
            if isLoading {
                self?.loader.startAnimating()
            } else {
                self?.loader.stopAnimating()
            }
        }
        viewModel.onError = { [weak self] error in
            self?.titleLabel.text = error
        }
    }
}
