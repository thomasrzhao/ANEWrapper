//
//  ANEContext.m
//  ANEWrappers
//
//  Created by thomasrzhao on 8/25/15.
//  Copyright (c) 2015 Thomas Zhao. All rights reserved.
//

#import "ANEContext.h"
#import "ANECommon_Private.h"
#import "ANEObject.h"

@implementation ANEContext
- (instancetype)initWithFREContext:(FREContext)ctx {
    self = [super init];
    if(self) {
        _freContext = ctx;
    }
    return self;
}

+ (instancetype)contextWithFREContext:(FREContext)ctx {
    return [[self alloc] initWithFREContext:ctx];
}

- (ANEObject*)actionScriptData {
    FREObject obj;
    ANE_assertOKResult(FREGetContextActionScriptData(_freContext, &obj));
    return [ANEObject objectWithFREObject:obj];
}

- (void)setActionScriptData:(ANEObject*)actionScriptData {
    ANE_assertOKResult(FRESetContextActionScriptData(_freContext, actionScriptData.freObject));
}

- (void*)nativeData {
    void* nativeData;
    FREGetContextNativeData(_freContext, &nativeData);
    return nativeData;
}

- (void)setNativeData:(void *)nativeData {
    ANE_assertOKResult(FRESetContextNativeData(_freContext, nativeData));
}

- (void)dispatchStatusEventAsyncWithCode:(NSString*)code level:(NSString*)level {
    ANE_assertOKResult(FREDispatchStatusEventAsync(_freContext, (uint8_t*)[code UTF8String], (uint8_t*)[level UTF8String]));
}
@end
