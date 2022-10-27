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

     open override func addAllSubviews() {
         super.addAllSubviews()
         view.addSubview(scrollView)
         scrollView.addSubview(contentView)
     }

     open override func addAllConstraints() {
         super.addAllConstraints()
         scrollView.snp.makeConstraints {
             $0.edges.equalTo(safeArea)
         }
         contentView.snp.makeConstraints {
             $0.edges.width.equalToSuperview()
         }
     }
 }
