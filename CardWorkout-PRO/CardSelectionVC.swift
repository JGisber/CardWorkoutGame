//
//  CardSelectionVC.swift
//  CardWorkout-PRO
//
//  Created by Josue Gisber on 12/3/20.
//

import UIKit

class CardSelectionVC: UIViewController {
	
	let cardImageView 	= UIImageView()
	let stopButton 		= CW_PROButton(backgroundColor: .systemRed, title: "Stop!")
	let resetButton 	= CW_PROButton(backgroundColor: .systemGreen, title: "Reset")
	let rulesButton 	= CW_PROButton(backgroundColor: .systemBlue, title: "Rules")
	var cards 			= Deck.allValues
	var timer: Timer!

	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureUI()
		startTimer()
    }
	
	func startTimer() {
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
	}
	
	@objc func stopTimer() {
		timer.invalidate()
	}
	
	@objc func resetTimer() {
		stopTimer()
		startTimer()
	}
	
	@objc func showRandomImage() {
		cardImageView.image = cards.randomElement()
	}
	
	func configureUI() {
		configureCardImageView()
		configureStopButton()
		configureResetButton()
		configureRulesButton()
	}
	
	
	// MARK: - CardView Configuration
	func configureCardImageView() {
		view.addSubview(cardImageView) // add card image to the view
		cardImageView.translatesAutoresizingMaskIntoConstraints = false
		cardImageView.image = UIImage(named: "AS") // set a default card to the view
		
		NSLayoutConstraint.activate([
			cardImageView.widthAnchor.constraint(equalToConstant: 250), // set the width of the card
			cardImageView.heightAnchor.constraint(equalToConstant: 350), // set the height of the card
			cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // set the card in center of the view
			cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  -100) // move the card up 100 point from y axis
		])
	}
	
	
	// MARK: - Stop Button Configuration
	func configureStopButton() {
		view.addSubview(stopButton) // add stopButton to the view
		stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			stopButton.widthAnchor.constraint(equalToConstant: 260),
			stopButton.heightAnchor.constraint(equalToConstant: 50),
			stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 40)
		])
	}
	
	
	// MARK: - Reset Button Configuration
	func configureResetButton() {
		view.addSubview(resetButton)
		resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			resetButton.widthAnchor.constraint(equalToConstant: 115),
			resetButton.heightAnchor.constraint(equalToConstant: 50),
			resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
			resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 40)
		])
	}
	
	
	// MARK: - Rules Button Configuration
	func configureRulesButton() {
		view.addSubview(rulesButton)
		rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			rulesButton.widthAnchor.constraint(equalToConstant: 115),
			rulesButton.heightAnchor.constraint(equalToConstant: 50),
			rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
			rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 40)
		])
	}
    
	// MARK: - Present the RulesVC
	@objc func presentRulesVC() {
		present(RulesVC(), animated: true)
	}

}
