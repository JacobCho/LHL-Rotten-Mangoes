//
//  TheatresMapViewController.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-30.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Movie.h"
#import "Theatre.h"
#define THEATRE_URL @"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?address=%@"

@interface TheatresMapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) Movie *movie;
@property (strong, nonatomic) NSMutableArray *theatresNearby;


@end
