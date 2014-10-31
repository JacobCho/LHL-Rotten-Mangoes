//
//  TheatreAnnotation.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-31.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "TheatreAnnotation.h"

@implementation TheatreAnnotation

-(instancetype)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)location {
    
    self = [super init];
    if (self) {
    _title = title;
    _coordinate = location;
    
    }
    return self;
    
}
-(MKAnnotationView *)annotationView {
    
    MKAnnotationView *customAnnotation = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotation"];
    
    customAnnotation.enabled = YES;
    customAnnotation.canShowCallout = YES;
    customAnnotation.image = self.image;
    
    return customAnnotation;
}

@end
