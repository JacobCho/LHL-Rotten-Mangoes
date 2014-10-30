//
//  WebViewController.m
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-29.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.movie.alternateURL]]];
}

@end
