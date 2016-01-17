//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Dmitriy Polskoy on 2016-01-11.
//  Copyright © 2016 Dmitriy Polskoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var maxTaps = 0
	var currentTaps = 0
	
	
	
	@IBOutlet weak var logoImg: UIImageView!
	@IBOutlet weak var howManyTapsTxt: UITextField!
	@IBOutlet weak var playBtn: UIButton!
	
	@IBOutlet weak var tapBtn: UIButton!
	@IBOutlet weak var tapsLbl: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func onPalyBtnPressed(sender: UIButton!) {
	
		if let howManyTaps = Int(howManyTapsTxt.text!) {
			
			logoImg.hidden = true
			playBtn.hidden = true
			howManyTapsTxt.hidden = true
			
			tapBtn.hidden = false
			tapsLbl.hidden = false
			
			maxTaps = howManyTaps
			currentTaps = 0;
			
			updateTapsLbl()
		}
	}
	
	@IBAction func onCointBtnPressed(sender: UIButton) {
		currentTaps++
		updateTapsLbl()
		
		if isGameOver() {
			restartGame()
		}
	}

	func updateTapsLbl() {
		tapsLbl.text = "\(currentTaps) Taps"
	}
	
	func isGameOver() -> Bool {
		return currentTaps >= maxTaps
	}
	
	func restartGame() {
		maxTaps = 0
		currentTaps = 0
		
		howManyTapsTxt.text = ""
		
		logoImg.hidden = false
		playBtn.hidden = false
		howManyTapsTxt.hidden = false
		
		tapBtn.hidden = true
		tapsLbl.hidden = true
	}
	
}

