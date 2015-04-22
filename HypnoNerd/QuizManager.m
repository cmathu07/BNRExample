//
//  QuizManager.m
//  HypnoNerd
//
//  Created by Chaitra Mathur on 4/8/15.
//  Copyright (c) 2015 Chaitra Mathur. All rights reserved.
//

#import "QuizManager.h"

@interface QuizManager ()
@property (strong) NSArray *questions;
@property (strong) NSArray *answers;

@end

@implementation QuizManager

+ (QuizManager *) sharedInstance {
	static QuizManager *_sharedInstance = nil;
	
	static dispatch_once_t oncePredicate;
	
	dispatch_once(&oncePredicate, ^{
		_sharedInstance = [[QuizManager alloc] init];
	});
	
	return _sharedInstance;
}


- (id) init {
	self = [super init];
	if(self) {
		_questions = @[@"What is the population of the world?",@"Which is the largest country in the world?",@"Which is the smallest country in the world?"];
		_answers = @[@"7.3 billion",@"Russia",@"Vatican City"];
	}
	return self;
}

- (NSArray *) getQuestions {
	return self.questions;
}

- (NSArray *) getAnswers {
	return self.answers;
}


@end
