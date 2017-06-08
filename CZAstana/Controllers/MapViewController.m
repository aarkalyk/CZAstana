//
//  MapViewController.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 6/1/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>
#import "MapViewController.h"

@interface MapViewController ()

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Местоположение ЦЗ Астана";
    
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestWhenInUseAuthorization];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:51.129674 longitude:71.422712 zoom:14.0f];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    mapView.settings.myLocationButton = YES;

    self.view = mapView;
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(51.129674, 71.422712);
    marker.title = @"CZ Astana";
    marker.map = mapView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
