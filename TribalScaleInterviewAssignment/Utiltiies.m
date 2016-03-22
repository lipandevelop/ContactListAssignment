//
//  Utiltiies.m
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-22.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "Utiltiies.h"

@implementation Utiltiies

+ (void)stylizeCellWithCell: (UITableViewCell *)cell andBackgroundImage: (UIImage *)image {
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.layer.shadowOffset = CGSizeMake(-1.5f, 3.0f);
    cell.textLabel.layer.shadowOpacity = 0.95f;
    cell.textLabel.layer.shadowRadius = 5.0f;
    cell.layer.contents = (__bridge id)image.CGImage;
    cell.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0f];
    cell.clipsToBounds = YES;
    cell.layer.contentsRect = CGRectMake(0, 0, 0.6f, 0.85f);
    cell.layer.contentsGravity = kCAGravityResizeAspectFill;
}

@end
