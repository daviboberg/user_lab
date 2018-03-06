//
//  EvaluationFormViewController.swift
//  Circle
//
//  Created by Leonardo Augusto Piovezan on 02/03/18.
//  Copyright © 2018 Gabriel Branco Frizzo. All rights reserved.
//

import UIKit
import Eureka
import RxEureka
import RxSwift
import RxCocoa
class EvaluationFormViewController: FormViewController {

    let disposableBag = DisposeBag()
    
    
    //var questions
    override func viewDidLoad() {
        super.viewDidLoad()

        createForm(questions: ["olaarr", "tudo beeeem?", "quem quer?","narutinho"])
        print(form.values())
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension EvaluationFormViewController{
    
    func createForm(questions:[String]){
        
        questions.forEach { (question) in
            let section = Section(question)
            let row = SegmentedRow<String>(){
                $0.options = ["Nunca", "As vezes", "Sempre"]
                $0.value = "As vezes"
            }
    
            row.rx.value.subscribe{ value in
                print(value)
            }.disposed(by: disposableBag)
            section <<< row
            form +++ section
        }
        
        
//
//        let rowTest = TextRow(){ row in
//            row.title = "Text Row"
//            row.placeholder = "Enter text here"
//        }
//
//        rowTest.rx.value
//            .asObservable()
//            .subscribe{ value in
//                print("Row Value is : \(value)")
//
//
//        }.disposed(by: disposableBag)
//
//        form +++ Section("Section1")
//            <<< TextRow(){ row in
//                row.title = "Text Row"
//                row.placeholder = "Enter text here"
//            }
//            <<< PhoneRow(){
//                $0.title = "Phone Row"
//                $0.placeholder = "And numbers here"
//                $0.tag = "1"
//            }
//            +++ Section("O ser humano é proativo?")
//            <<< DateRow(){
//                $0.title = "Date Row"
//                $0.value = Date(timeIntervalSinceReferenceDate: 0)
//                $0.tag = "2"
//            }
//            <<< SegmentedRow<String>(){
//                $0.title = "narutinho"
//                $0.options = ["Nunca", "As vezes", "Sempre"]
//                $0.value = "As vezes"
//                $0.tag = "3"
//        }
        
    }
    

    
    
    
}
