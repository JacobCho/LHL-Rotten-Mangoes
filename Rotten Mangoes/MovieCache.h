//
//  MovieCache.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-30.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCache : NSObject

@property (nonatomic, strong) NSMutableDictionary *posterImages;
@property (nonatomic, assign) int counter;
@property (nonatomic, assign) int size;

-(instancetype)initMovieCacheWithSize:(int)newSize;
-(BOOL)containsMovieWithIdNumber:(NSString *)idNumber;
-(void)cacheMovie:(Movie *)movie withPoster:(UIImage *)posterImage;
-(UIImage *)posterImageWithIdNumber:(NSString *)idNumber;

@end
