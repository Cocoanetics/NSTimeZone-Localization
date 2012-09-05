//
//  NSTimeZone+Translation.m
//  Summertime
//
//  Created by Oliver Drobnik on 3/2/11.
//  Copyright 2011 Cocoanetics. All rights reserved.
//

#import "NSTimeZone+Translation.h"


@implementation NSTimeZone (Translation)

- (NSString *)localizedGeoName
{
	NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"NSTimeZoneLocalization" ofType:@"bundle"];
	NSBundle *resourceBundle = [NSBundle bundleWithPath:resourcePath];
	
	return NSLocalizedStringFromTableInBundle(self.name, @"LocalizableTimezones", resourceBundle, @"NSTimeZone+Translation");
}

@end
