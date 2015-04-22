//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Chaitra Mathur on 2/20/15.
//  Copyright (c) 2015 Chaitra Mathur. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()
@property(nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.tabBarItem.title = @"Reminder";

    UIImage *image = [UIImage imageNamed:@"Time.png"];
    self.tabBarItem.image = image;
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  NSLog(@"BNRReminderViewController loaded...");
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	  NSLog(@"BNRReminderViewController view will appear");
	self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addReminder:(id)sender {
  NSDate *date = self.datePicker.date;
  NSLog(@"Setting a reminder for %@", date);

  UILocalNotification *notification = [[UILocalNotification alloc] init];
  notification.alertBody = @"Hypnotize me!";
  notification.fireDate = date;
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
