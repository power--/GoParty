//
//  MapTipView.h
//  GoParty
//
//  Created by maszmacadmin on 14-3-1.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define ORC_RADIUS 12
@interface MapTipView : UIView {
    CGPoint origin;
    CGPoint point;
    CGSize size;
    UIFont *font;
    UILabel *label;
    NSString *title;
    UIButton *button;
    UIBezierPath *path;
}

@property (nonatomic, retain) NSString *title;

-(void)set_path;
-(id) init:(CGPoint) p str:(NSString*) str;
-(void)set_point:(CGPoint)p;
-(void) set_title:(NSString*) str;
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;
- (id)initWithFrame:(CGRect)frame point:(CGPoint)p;

@end
