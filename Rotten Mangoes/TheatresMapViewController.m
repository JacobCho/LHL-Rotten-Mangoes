//
//  TheatresMapViewController.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-30.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "TheatresMapViewController.h"
#import "TheatreTableViewController.h"

@interface TheatresMapViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;
@end


@implementation TheatresMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpMapView];
    
    
    [self reverseGeocode:self.locationManager.location];
    
    
}

-(void)setTableView {
    TheatreTableViewController *theatreTable = self.childViewControllers[0];
    
    theatreTable.theatresNearby = self.theatresNearby;
    
    [theatreTable.tableView reloadData];
    
}


-(void)setUpMapView {
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager requestWhenInUseAuthorization];
    
    [self.locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    
    
    self.mapView.showsPointsOfInterest = YES;
    CLLocationCoordinate2D startingLocation;
    startingLocation.latitude = 49.281815;
    startingLocation.longitude =-123.108219;
    
    //[self.mapview setCenterCoordinate:startingLocation];
    
    MKCoordinateRegion startingRegion;
    startingRegion.center = startingLocation;
    startingRegion.span.latitudeDelta = 0.02;
    startingRegion.span.longitudeDelta = 0.02;
    
    [self.mapView setRegion:startingRegion];
    
    

    
}

- (void)reverseGeocode:(CLLocation *)location {
    
    __block NSString *postalCode = @"";

    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Finding address");
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            CLPlacemark *tempPlacemark = [placemarks lastObject];
            postalCode = tempPlacemark.postalCode;
            NSLog(@"Completed: %@", postalCode);
            
            [self getTheatres:postalCode];
        }
    }];

}

-(void)getTheatres:(NSString *)postalCode {
    
    NSString *newPostalCode = [postalCode stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *URLwithCode = [NSString stringWithFormat:THEATRE_URL, newPostalCode];
    NSString *URL = [URLwithCode stringByAppendingString:@"&movie="];
    NSString *extendedURL = [URL stringByAppendingString:self.movie.URLname];
    
    NSURL *reviewsURL = [NSURL URLWithString:extendedURL];
    
    NSData *data = [NSData dataWithContentsOfURL:reviewsURL];
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    self.theatresNearby = [NSMutableArray array];
    
    NSArray *theatresArray = [dataDictionary objectForKeyedSubscript:@"theatres"];
    
    
    for (NSDictionary *theatresDictionary in theatresArray) {
        
        Theatre *theatre = [[Theatre alloc] init];
        theatre.name = [theatresDictionary objectForKey:@"name"];
        theatre.address = [theatresDictionary objectForKey:@"address"];
        theatre.latitude = [theatresDictionary objectForKey:@"lat"];
        theatre.longitude = [theatresDictionary objectForKey:@"lng"];
        NSLog(@"%@", theatre.name);
        [self.theatresNearby addObject:theatre];
        
    }
    [self setTableView];
    [self setupMarkers:self.theatresNearby];
    
}

-(void)setupMarkers:(NSMutableArray *)theatresArray{
    
    for (Theatre *theatreToMark in theatresArray) {
        
        MKPointAnnotation *theatreMarker=[[MKPointAnnotation alloc] init];
        CLLocationCoordinate2D theatreLocation;
        theatreLocation.latitude = [theatreToMark.latitude doubleValue];
        theatreLocation.longitude = [theatreToMark.longitude doubleValue];
        
        theatreMarker.coordinate = theatreLocation;
        theatreMarker.title = theatreToMark.name;
        
        [self.mapView addAnnotation:theatreMarker];
    }
    
    
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
