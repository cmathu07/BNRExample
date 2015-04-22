//
//  QuizManager.h
//  HypnoNerd
//
//  Created by Chaitra Mathur on 4/8/15.
//  Copyright (c) 2015 Chaitra Mathur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizManager : NSObject

+ (QuizManager *)sharedInstance;

- (NSArray *) getQuestions;

- (NSArray *) getAnswers;
@end
