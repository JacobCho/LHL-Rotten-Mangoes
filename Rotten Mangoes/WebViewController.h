//
//  WebViewController.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) Movie *movie;



@end
