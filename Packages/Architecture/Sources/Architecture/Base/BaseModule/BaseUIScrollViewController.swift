//
//  BaseUIScrollViewController.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/8/22.
//

import UIKit

 open class BaseUIScrollViewController: BaseViewControllerImpl {
     /**
      Use snp.remakeConstraints instead of snp.makeConstraints
       - Contraints:  Use snp.remakeConstraints for custom anchor
      */
     public lazy var scrollView = UIScrollView()
     /**
      Use contentView.addSubview instead of view.addSubview
       - Content view:  Use snp.remakeConstraints for custom anchor
      */
     public lazy var contentView = UIView()

     open override func setupView() {
         super.setupView()
         setupScrollView()
         setupContentView()
     }

     private func setupScrollView() {
         view.addSubview(scrollView)
         scrollView.snp.makeConstraints {
             $0.edges.equalTo(safeArea)
         }
     }

     private func setupContentView() {
         scrollView.addSubview(contentView)
         contentView.snp.makeConstraints {
             $0.edges.width.equalToSuperview()
         }
     }
 }
