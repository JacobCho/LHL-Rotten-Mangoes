//
//  TheatreAnnotation.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-31.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface TheatreAnnotation : NSObject <MKAnnotation>


@property (copy, nonatomic) NSString *title;
@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) UIImage *image;

-(instancetype)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)location;
-(MKAnnotationView *)annotationView;

@end
