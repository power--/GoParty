//
//  GoPartyUtilities.m
//  GoParty
//
//  Created by JoeTang on 14-3-16.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "GoPartyUtilities.h"
#import <objc/runtime.h>

@implementation GoPartyUtilities

+(NSDictionary *)GetDicFromNormalClass:(id) classInstance{
    
    Class clazz = [classInstance class];
    u_int count;
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray* valueArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        objc_property_t prop=properties[i];
        const char* propertyName = property_getName(prop);
        [propertyArray addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        //        const char* attributeName = property_getAttributes(prop);
        
        
        //        NSLog(@"%@",[NSString stringWithUTF8String:propertyName]);
        //        NSLog(@"%@",[NSString stringWithUTF8String:attributeName]);
        
        id value =  [classInstance performSelector:NSSelectorFromString([NSString stringWithUTF8String:propertyName])];
        if(value ==nil)
            [valueArray addObject:[NSNull null]];
        else {
            [valueArray addObject:value];
        }
        
        //        NSLog(@"%@",value);
        
    }
    free(properties);
    
    
    NSDictionary* returnDic = [NSDictionary dictionaryWithObjects:valueArray forKeys:propertyArray];
    
    NSLog(@"%@", returnDic);
    
    return returnDic;
    
}


@end
