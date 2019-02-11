//
//  ViewController.swift
//  ConcurrencyTest
//
//  Created by Tanin on 11/02/2019.
//  Copyright © 2019 landtanin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primeNumberBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calculatePrimeNumbers(_ sender: UIButton) {
        
        enablePrimeButton(enable: false)
        
        let queue = OperationQueue()
//        let operation = CalculatePrimeOperation()
//        queue.addOperation(operation)
        
        queue.addOperation {
            for number in 0...100_0000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is prime: \(isPrimeNumber)")
            }
            OperationQueue.main.addOperation {
                self.enablePrimeButton(enable: true)
            }
        }
        
    }
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        if number <= 3 {
            return true
        }
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
 
    func enablePrimeButton(enable: Bool) {
        primeNumberBtn.isEnabled = enable
        if enable {
            primeNumberBtn.setTitle("Calculate Prime Numbers", for: .normal)
        } else {
            primeNumberBtn.setTitle("Calculating...", for: .normal)
        }
    }
    
}

