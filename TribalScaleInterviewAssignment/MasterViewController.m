//
//  MasterViewController.m
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Contact.h"
#import "ContactFetcher.h"
#import "ContactBuilder.h"
#import "DetailView.h"
#import "Utiltiies.h"

static const int kNumberOfContacts = 20;
static const float kZero = 0;
static const float kRowHeight = 160.0f;

@interface MasterViewController () <UITableViewDelegate>

@property (nonatomic, strong) ContactFetcher *contactFetcher;
@property (nonatomic, strong) ContactBuilder *contactBuilder;
@property (nonatomic, strong) Contact *contact;
@property (nonatomic, strong) DetailView *detailedView;

@property (nonatomic, strong) NSMutableArray *contacts;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupDetailView];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)setupTableView {
    self.tableView.tintColor = [UIColor blackColor];
    self.tableView.bounces = NO;
    self.tableView.rowHeight = kRowHeight;
    self.contactFetcher = [[ContactFetcher alloc] init];
    self.contactBuilder = [[ContactBuilder alloc] init];
    self.contacts = [[NSMutableArray alloc]init];
    [self populateCells];
}

- (void)populateCells {
    for (int i = kZero; i < kNumberOfContacts; i++) {
        [self.contactFetcher fetchContactData:^(NSDictionary *jsonDictionary) {
            Contact *newContact = [self.contactBuilder buildContactsFrom:jsonDictionary];
            [self.tableView reloadData];
            [self.contacts addObject:newContact];
            
        } failure:^(NSError *reason) {
            NSLog(@"Error");
        }];
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)setupDetailView {
    self.detailedView = [[DetailView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, kZero, self.view.frame.size.width/2, self.view.frame.size.height)];
    self.detailedView.backgroundColor = [UIColor blackColor];
    [self.detailedView setupContents];
    [self.tableView addSubview:self.detailedView];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)
    indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    Contact *contact = self.contacts[indexPath.row];
    UIImage *cellBackground = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:contact.largePictureURL]]];
    self.detailedView.detailedContactInfo = contact;
    [Utiltiies stylizeCellWithCell:cell andBackgroundImage:cellBackground];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    gesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell.contentView addGestureRecognizer:gesture];
    return cell;
}

- (void)didSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
            CGPoint location = [gestureRecognizer locationInView:self.tableView];

            NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
            Contact *contact = [self.contacts objectAtIndex:indexPath.row];
        
        [UIView animateWithDuration:0.75f animations:^{
            NSLog(@"swiped");
//            self.tableView.alpha = 0.75f;
            self.detailedView.frame = CGRectMake(CGRectGetMidX(self.view.frame), self.tableView.contentOffset.y, self.view.frame.size.width/2, self.view.frame.size.height);
            UIImage *headShotImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:contact.mediumPictureURL]]];
            self.detailedView.mediumPictureView.layer.contents = (__bridge id)headShotImage.CGImage;
            self.detailedView.mediumPictureView.layer.contentsGravity = kCAGravityResizeAspect;
            self.detailedView.nameLabel.text = [NSString stringWithFormat:@"%@. %@ %@", contact.title, contact.firstName, contact.lastName];
            self.detailedView.addressLabel.text = [NSString stringWithFormat:@"%@,\n%@\n%@, %@", contact.street, contact.city, contact.state, contact.zip];
            self.detailedView.personalInfolabel.text = [NSString stringWithFormat:@"%@, DOB: %@", contact.gender, contact.dob];
            self.detailedView.contactInfoLabel.text = [NSString stringWithFormat:@"Email:%@\nCell:%@\nPhone:%@", contact.email, contact.cell, contact.phone];
            [self.detailedView.backButton addTarget:self action:@selector(hideDetailView:) forControlEvents:UIControlEventTouchUpInside];
        }];
        [self.tableView setNeedsDisplay];
    }
}

- (void)hideDetailView: (UIButton *)sender {
    [UIView animateWithDuration:0.75f animations:^{
//        NSLog(@"swiped");
        self.tableView.alpha = 1.0f;
        self.detailedView.frame = CGRectMake(self.view.frame.size.width, self.tableView.contentOffset.y, self.view.frame.size.width/2, self.view.frame.size.height);
    }];
    [self.tableView setNeedsDisplay];
}

@end
