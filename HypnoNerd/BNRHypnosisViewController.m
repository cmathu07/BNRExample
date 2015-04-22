//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Chaitra Mathur on 2/20/15.
//  Copyright (c) 2015 Chaitra Mathur. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.tabBarItem.title = @"Hypnotize";

    UIImage *image = [UIImage imageNamed:@"Hypno.png"];
    self.tabBarItem.image = image;
  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.

//  UISegmentedControl *svc = [[UISegmentedControl alloc]
//      initWithFrame:CGRectMake(0, self.view.frame.size.height - 100,
//                               self.view.frame.size.width, 50)];
//
//  [svc insertSegmentWithTitle:@"Red" atIndex:0 animated:NO];
//  [svc insertSegmentWithTitle:@"Green" atIndex:1 animated:NO];
//  [svc insertSegmentWithTitle:@"Blue" atIndex:2 animated:NO];
//
//
//  [svc addTarget:self.view
//                   action:@selector(setHypnosisColor:)
//         forControlEvents:UIControlEventValueChanged];
//	
//  [svc setSelectedSegmentIndex:0];
//  [self.view addSubview:svc];
	
	
	
  NSLog(@"BNRHypnosisViewController loaded");
}


- (void)loadView {
  CGRect frame = [UIScreen mainScreen].bounds;
  BNRHypnosisView *backgroundView =
      [[BNRHypnosisView alloc] initWithFrame:frame];
	
	CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
	UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
	textField.borderStyle = UITextBorderStyleRoundedRect;
	textField.placeholder = @"Hypnotize me";
	textField.returnKeyType = UIReturnKeyDone;
	textField.delegate = self;
	[backgroundView addSubview:textField];
  self.view = backgroundView;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	NSLog(@"%@", textField.text);
	
	[self drawHypnoticMessage:textField.text];
	textField.text = @"";
	[textField resignFirstResponder];
	return YES;
}

- (void) drawHypnoticMessage: (NSString *) message {
	for (int i=0; i<20; i++) {
		UILabel *label = [[UILabel alloc] init];
		label.text = message;
		label.backgroundColor = [UIColor clearColor];
		label.textColor = [UIColor whiteColor];
		
		[label sizeToFit];
		
		int width = self.view.bounds.size.width - label.bounds.size.width;
		int height = self.view.bounds.size.height - label.bounds.size.height;
		
		int x = arc4random() % width;
		int y = arc4random() % height;
		
		CGRect labelFrame = CGRectMake(x, y, label.bounds.size.width, label.bounds.size.height);
		label.frame = labelFrame;
		[self.view addSubview:label];
		
	}
}

@end
