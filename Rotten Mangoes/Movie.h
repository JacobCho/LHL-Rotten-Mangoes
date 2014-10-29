//
//  Movie.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDictionary *posters;
@property (strong, nonatomic) NSString *thumbnail;

- (id) initWithTitle:(NSString *)title;
+ (id) movieWithTitle:(NSString *)title;
- (NSURL *) thumbnailURL;
- (NSURL *) detailPosterURL;

@end
