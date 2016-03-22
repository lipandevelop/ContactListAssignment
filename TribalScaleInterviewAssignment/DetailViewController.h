//
//  DetailViewController.h
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

