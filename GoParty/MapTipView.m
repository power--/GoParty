//
//  MapTipView.m
//  GoParty
//
//  Created by maszmacadmin on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "MapTipView.h"

@implementation MapTipView
@synthesize title;
-(id) init:(CGPoint) p str:(NSString*) str
{
    if([super init] == nil)
        return nil;
    path = [[UIBezierPath alloc] init];
    label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    [label setBackgroundColor: [UIColor clearColor]];
    font = [UIFont systemFontOfSize:15.0];
    label.font = font;
    button = [[UIButton alloc] init];
    [button setBackgroundColor: [UIColor clearColor]];
    [button setTitle:@">" forState:UIControlStateNormal];
    [self setBackgroundColor: [UIColor clearColor]];
    [self setAlpha:0.8];
    [self addSubview: label];
    [self addSubview: button];
    [self set_point: p];
    [self set_title: str];
    return (self);
}

- (id)initWithFrame:(CGRect)frame point:(CGPoint)p
{
    if([super init] == nil)
        return nil;
    path = [[UIBezierPath alloc] init];
//    label = [[UILabel alloc] init];
//    label.numberOfLines = 0;
//    [label setBackgroundColor: [UIColor clearColor]];
//    font = [UIFont systemFontOfSize:15.0];
//    label.font = font;
//    button = [[UIButton alloc] init];
//    [button setBackgroundColor: [UIColor clearColor]];
//    [button setTitle:@">" forState:UIControlStateNormal];
    [self setBackgroundColor: [UIColor clearColor]];
    [self setAlpha:0.8];
//    [self addSubview: label];
//    [self addSubview: button];
    [self set_point: p];
    [self set_Frame:frame];
    return (self);
}

-(void)set_point:(CGPoint)p
{
    point = p;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor grayColor] setFill];
    [path fill];
}

- (void)set_Frame:(CGRect)frame
{
    size = frame.size;
    double bw = (size.width - ORC_RADIUS*3)/2;
    double x = point.x - bw;
    double y = point.y - size.height;
    origin.x = x;
    origin.y = y;
    self.frame = CGRectMake(origin.x, origin.y, size.width, size.height);
    [self set_path];
}

-(void) set_title:(NSString*) str
{
    label.text = str;
    CGSize csize;
    csize.width = 250;
    csize.height = 60;
    size = [str sizeWithFont:font constrainedToSize: csize
               lineBreakMode: NSLineBreakByTruncatingTail];
    
    label.frame = CGRectMake(10, 3, size.width, size.height);
    button.frame = CGRectMake(20+size.width, 3, 50, size.height);
    size.height += 30;
    size.width += 60;
    double bw = (size.width - ORC_RADIUS*3)/2;
    double x = point.x - bw;
    double y = point.y - size.height;
    origin.x = x;
    origin.y = y;
    self.frame = CGRectMake(origin.x, origin.y, size.width, size.height);
    [self set_path];
}

- (BOOL)pointInside:(CGPoint)p withEvent:(UIEvent *)event
{
    return [path containsPoint:p];
}

-(void)set_path
{
    double h = size.height - ORC_RADIUS*3;
    double bw = (size.width - ORC_RADIUS*3)/2;
    CGPoint p = CGPointMake(ORC_RADIUS, 0);
    [path moveToPoint:p];
    p.x += size.width - ORC_RADIUS*2;
    [path addLineToPoint: p];
    p.y += ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:3.1414926*1.5
                  endAngle:0
                 clockwise:YES];
    p.x += ORC_RADIUS;
    p.y += h;
    [path addLineToPoint: p];
    
    p.x -= ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:0
                  endAngle:3.1415926/2.0
                 clockwise:YES];
    p.y += ORC_RADIUS;
    p.x -= bw;
    [path addLineToPoint: p];
    
    p.x -= ORC_RADIUS/2;
    p.y += ORC_RADIUS;
    [path addLineToPoint: p];
    p.x -= ORC_RADIUS/2;
    p.y -= ORC_RADIUS;
    [path addLineToPoint: p];
    p.x -= bw;
    [path addLineToPoint: p];
    p.y -= ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:3.1415926/2.0
                  endAngle:3.1415926
                 clockwise:YES];
    p.x -= ORC_RADIUS;
    p.y -= h;
    [path addLineToPoint: p];
    p.x += ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:3.1415926
                  endAngle:3.1415926*1.5
                 clockwise:YES];
    [path closePath];
}
@end