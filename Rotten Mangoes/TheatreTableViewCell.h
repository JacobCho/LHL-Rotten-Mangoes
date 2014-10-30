//
//  TheatreTableViewCell.h
//  Rotten Mangoes
//
//  Created by Jacob Cho on 2014-10-30.
//  Copyright (c) 2014 Jacob Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheatreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *theatreNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *theatreAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *theatreDistanceLabel;

@end
