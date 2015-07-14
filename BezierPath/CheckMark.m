//
//  CheckMark.m
//  BezierPath
//
//  Created by Evgeny on 13.07.15.
//  Copyright (c) 2015 Evgeny Nazarov. All rights reserved.
//

#import "CheckMark.h"

@interface CheckMark ()
@property (nonatomic, strong) CAShapeLayer *checkmarkLayer;
@property (nonatomic, strong) UIBezierPath *checkmarkPath;
@end

@implementation CheckMark
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self createLayer];
        [self createPath];
        
        
        return self;
    }
    
    return nil;
}

- (void)createLayer {
    self.checkmarkLayer = [[CAShapeLayer alloc] init];
    self.checkmarkLayer.strokeColor   = [UIColor blackColor].CGColor;
    self.checkmarkLayer.fillColor     = [UIColor clearColor].CGColor;
    self.checkmarkLayer.lineWidth     = 6;
    self.checkmarkLayer.strokeStart = 0;
    self.checkmarkLayer.strokeEnd = 1.f;
    self.checkmarkLayer.lineJoin      = kCALineJoinRound;
    self.checkmarkLayer.lineCap       = kCALineCapRound;
    self.checkmarkLayer.frame = self.bounds;
    [self.layer addSublayer:self.checkmarkLayer];
}

- (void)createPath {
    CGFloat strokeWidth = self.checkmarkLayer.lineWidth;
    CGSize size = self.bounds.size;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, strokeWidth/2.f, size.height/2.f);
    CGPathAddLineToPoint(path, nil, ceilf(size.width*.4f), size.height-strokeWidth/2.f);
    CGPathAddLineToPoint(path, nil, size.width-strokeWidth/2.f, strokeWidth/2.f);
    self.checkmarkPath = [UIBezierPath bezierPathWithCGPath:path];
}

- (void)show {
    CABasicAnimation *animateCheckmark = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animateCheckmark.duration  = .7f;
    animateCheckmark.fromValue   = [NSNumber numberWithFloat:0.f];
    animateCheckmark.toValue   = [NSNumber numberWithFloat:1.f];
    self.checkmarkLayer.path = self.checkmarkPath.CGPath;
    [self.checkmarkLayer addAnimation:animateCheckmark forKey:nil];
}

@end
