//
//  MapDemoViewController.swift
//  iOS_Storage
//
//  Created by caiqiang on 2019/10/17.
//  Copyright © 2019 蔡强. All rights reserved.
//

import UIKit
import MapKit

class MapDemoViewController: CQBaseViewController {
    
    private let locationManager = CLLocationManager()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.width))
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.showsTraffic = true
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.userTrackingMode = .follow
        return mapView
    }()
    
    private lazy var userPositionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "my_location"), for: .normal)
        button.addTarget(self, action: #selector(userPositionButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        setupUI()
        loadData()
    }
    
    deinit {
        print("释放")
    }
    
    private func setupUI() {
        view.addSubview(mapView)
        
        view.addSubview(userPositionButton)
        userPositionButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(mapView).offset(-20)
        }
    }
    
    private func loadData() {
        let storeAnnotation = StoreAnnotation()
        storeAnnotation.title = "store1"
        storeAnnotation.subtitle = "这是详情"
        storeAnnotation.coordinate = CLLocationCoordinate2D(latitude: 30.655942, longitude: 104.077104)
        storeAnnotation.image = UIImage.init(named: "store")
        storeAnnotation.name = "name1"
        storeAnnotation.isSelected = false
        storeAnnotation.index = 0
        mapView.addAnnotation(storeAnnotation)
        
        let storeAnnotation2 = StoreAnnotation()
        storeAnnotation2.title = "store2"
        storeAnnotation2.subtitle = "这是详情2"
        storeAnnotation2.coordinate = CLLocationCoordinate2D(latitude: 30.654942, longitude: 104.077104)
        storeAnnotation2.image = UIImage.init(named: "store2")
        storeAnnotation2.isSelected = true
        storeAnnotation2.name = "name2"
        storeAnnotation2.index = 1
        mapView.addAnnotation(storeAnnotation2)
        
        let parkAnnotation = ParkAnnotation()
        parkAnnotation.title = "park"
        parkAnnotation.subtitle = "公园相亲"
        parkAnnotation.coordinate = CLLocationCoordinate2D(latitude: 30.652942, longitude: 104.078104)
        mapView.addAnnotation(parkAnnotation)
    }
    
    /// 回到我的位置
    @objc private func userPositionButtonClicked() {
        let region = MKCoordinateRegion.init(center: mapView.userLocation.coordinate, span: mapView.region.span)
        mapView.setRegion(region, animated: true)
    }
    
}


// MARK: - Delegate - 地图

extension MapDemoViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //        if annotation.isMember(of: MKPointAnnotation.self) {
        //            let reuseIdentifier = "my_annotationReuseIdentifier"
        //            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        //            if annotationView == nil {
        //                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        //            }
        //            annotationView?.image = UIImage(named: "location")
        //            annotationView?.annotation = annotation
        //            annotationView?.canShowCallout = true
        //            return annotationView!
        //        }
        
        if annotation.isMember(of: StoreAnnotation.self) {
            if let anno = annotation as? StoreAnnotation {
                let reuseIdentifier = "store_annotationReuseIdentifier"
                var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? StoreAnnotationView
                if annotationView == nil {
                    annotationView = StoreAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
                }
                annotationView?.canShowCallout = true
                annotationView?.image = anno.image
                annotationView?.annotation = anno
                return annotationView!
            }
        } else if annotation.isMember(of: ParkAnnotation.self) {
            let reuseIdentifier = "park_annotationReuseIdentifier"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            }
            annotationView?.image = UIImage(named: "park")
            annotationView?.annotation = annotation
            annotationView?.canShowCallout = true
            return annotationView!
        }
        
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let anno = view.annotation as? StoreAnnotation {
            print(anno.name)
        }
    }
    
}
