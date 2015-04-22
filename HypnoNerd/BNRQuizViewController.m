//
//  BNRQuizViewController.m
//  HypnoNerd
//
//  Created by Chaitra Mathur on 4/8/15.
//  Copyright (c) 2015 Chaitra Mathur. All rights reserved.
//

#import "BNRQuizViewController.h"
#import "QuizManager.h"

@interface BNRQuizViewController ()
@property (weak) IBOutlet UILabel *question;
@property (weak) IBOutlet UILabel *answer;

@property (strong) NSArray *questions;
@property (strong) NSArray *answers;
@property int index;

@end

@implementation BNRQuizViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if(self) {
		self.tabBarItem.title = @"Quiz!";
		UIImage *image = [UIImage imageNamed:@"Quiz"];
		self.tabBarItem.image = image;
		_index = -1;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	_questions = [[QuizManager sharedInstance] getQuestions];
	_answers = [[QuizManager sharedInstance] getAnswers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
	++self.index;
	
	if(self.index == [self.questions count])
		self.index = 0;
	self.question.text = self.questions[self.index];
	self.answer.text = @"????";
}

- (IBAction)showAnswer:(id)sender {
	self.answer.text = self.answers[self.index];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
