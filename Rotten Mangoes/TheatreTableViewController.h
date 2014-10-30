//
//  TheatreTableViewController.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-30.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Theatre.h"

@interface TheatreTableViewController : UITableViewController

@property (strong, nonatomic) Theatre *theatre;
@property (strong, nonatomic) NSMutableArray *theatresNearby;

@end
