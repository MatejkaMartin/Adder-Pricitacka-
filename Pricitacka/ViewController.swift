//
//  ViewController.swift
//  Pricitacka
//
//  Created by Martin Matějka on 23.03.16.
//  Copyright © 2016 Martin Matějka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Outlets
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var nazevHry: UIImageView!
    @IBOutlet weak var pocetNavyseni: UITextField!
    @IBOutlet weak var restartBtn: UIButton!
    
    
    @IBOutlet weak var prictiBtn: UIButton!
    @IBOutlet weak var vypocet: UILabel!
    
    //Variables
    
    var navyseni: Int = 0
    var aktualniCislo: Int = 0
    
    

    @IBAction func zmacknutiPlay(sender: UIButton) {
        
        
        
       if pocetNavyseni.text != nil && pocetNavyseni.text != "" {
        navyseni = Int(pocetNavyseni.text!)!
        playBtn.hidden = true
        nazevHry.hidden = true
        pocetNavyseni.hidden = true
        
        
        prictiBtn.hidden = false
        vypocet.hidden = false
        restartBtn.hidden = false
        updateVysledek()
        
       }
        
        
    }
    
    @IBAction func pricti(sender: UIButton) {
        aktualniCislo = aktualniCislo + navyseni
        updateVysledek()
        
        
        
    }
    
    
    @IBAction func restartBtn(sender: AnyObject) {
        restartGame()
        
    }
    
    func restartGame(){
        prictiBtn.hidden = true
        vypocet.hidden = true
        restartBtn.hidden = true
        
        playBtn.hidden = false
        nazevHry.hidden = false
        pocetNavyseni.hidden = false
        
        pocetNavyseni.text = ""
        aktualniCislo = 0
        
    }
    
    func updateVysledek(){
        let vysledek = aktualniCislo + navyseni
        vypocet.text = "\(aktualniCislo) + \(navyseni) = \(vysledek) "
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

