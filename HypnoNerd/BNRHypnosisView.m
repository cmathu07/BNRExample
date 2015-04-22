//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Chaitra Mathur on 1/30/15.
//  Copyright (c) 2015 Chaitra Mathur. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView ()
@property (nonatomic, strong) UIColor *circleColor;

@end
@implementation BNRHypnosisView


- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
		_circleColor = [UIColor blackColor];
	}
	return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"%@ was touched", self);
	float red = (arc4random() % 100) / 100.0;
	float blue = (arc4random() % 100) / 100.0;
	float green = (arc4random() % 100) / 100.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

- (void) setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	CGRect bounds = self.bounds;
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;

	//float radius = MIN(bounds.size.width,bounds.size.height)/2.0;
	float maRradius = hypot(bounds.size.width, bounds.size.height) / 2.0;

	UIBezierPath *path = [[UIBezierPath alloc] init];

	for (float currentRadius = maRradius; currentRadius > 0; currentRadius -= 20) {
		[path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
		[path addArcWithCenter:center radius:currentRadius startAngle:0 endAngle:M_PI * 2 clockwise:true];
	}

	path.lineWidth = 10;
	[self.circleColor setStroke];
	[path stroke];

	CGContextRef currentContext = UIGraphicsGetCurrentContext();

	CGContextSaveGState(currentContext);

//	UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
//
//	int length = 160;
//	CGPoint firstPoint = CGPointMake(center.x, center.y - length);
//	CGPoint secondPoint = CGPointMake(center.x - length, center.y + length);
//	CGPoint thirdPoint = CGPointMake(center.x + length, center.y + length);
//
//	[trianglePath moveToPoint:firstPoint];
//	[trianglePath addLineToPoint:secondPoint];
//	[trianglePath addLineToPoint:thirdPoint];
//	[[UIColor blackColor] setStroke];
//	[trianglePath stroke];
//	[trianglePath addClip];
//
//	// Draw your gradient here
//	CGFloat locations[2] = { 0.0, 1.0 };
//	CGFloat components[8] = { 1.0, 0.0, 0.0, 1.0,   // Start color is red
//		                      1.0, 1.0, 0.0, 1.0 }; // End color is yellow
//
//	CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
//	CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components,
//	                                                             locations, 2);
//	CGPoint startPoint = CGPointMake(0, 50);
//	CGPoint endPoint = CGPointMake(0.0, bounds.size.height - 50.0);
//	CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
//	CGGradientRelease(gradient);
//	CGColorSpaceRelease(colorspace);
//
//	CGContextRestoreGState(currentContext);
//	CGContextSaveGState(currentContext);
//
//	CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
//	UIImage *image = [UIImage imageNamed:@"logo.png"];
//	CGRect imageRect = CGRectMake(bounds.size.width / 2.0 - 125, bounds.size.height / 2.0 - 125, 250, 250);
//	[image drawInRect:imageRect];
//
//	CGContextRestoreGState(currentContext);
}

- (void)setHypnosisColor:(id)sender {
	UISegmentedControl *segCtrl = (UISegmentedControl *) sender;
	NSInteger index = [segCtrl selectedSegmentIndex];
	if (index == 0)
		[self setBackgroundColor:[UIColor redColor]];
	else if (index == 1)
		[self setBackgroundColor:[UIColor greenColor]];
	else if (index == 2)
		[self setBackgroundColor:[UIColor blueColor]];
}

@end
