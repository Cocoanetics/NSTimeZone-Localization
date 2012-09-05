//
//  UnitTest.m
//  UnitTest
//
//  Created by Oliver Drobnik on 9/5/12.
//  Copyright (c) 2012 Cocoanetics. All rights reserved.
//

#import "UnitTest.h"
#import "NSTimeZone+Translation.h"

@implementation UnitTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)performTestInLanguage:(NSString *)language
{
	// get the octest bundle for the unit test
	NSBundle *unitTestBundle = [NSBundle bundleForClass:[self class]];
	
	// strings are in a resource bundle in the main/test bundle
	NSString *resourcePath = [unitTestBundle pathForResource:@"NSTimeZoneLocalization" ofType:@"bundle"];
	NSBundle *resourceBundle = [NSBundle bundleWithPath:resourcePath];
	
	// find the strings file for this language
	NSString *stringsFilePath = [resourceBundle pathForResource:@"LocalizableTimezones" ofType:@"strings" inDirectory:nil forLocalization:language];
	
	STAssertNotNil(stringsFilePath, @"Couldn't find strings file for language '%@'", language);
	
	// make a bundle for just this strings file
	NSBundle *languageSpecificBundle = [[NSBundle alloc] initWithPath:[stringsFilePath stringByDeletingLastPathComponent]];
	
	// get all time zone names
	NSArray *timezoneNames = [NSTimeZone knownTimeZoneNames];
	
	for (NSString *tzName in timezoneNames)
	{
		NSString *localizedGeoName = NSLocalizedStringWithDefaultValue(tzName, @"LocalizableTimezones", languageSpecificBundle, @"###MISSING###", @"NSTimeZone+Translation");
		
		BOOL hasTranslation = ![localizedGeoName isEqualToString:@"###MISSING###"];
		
		STAssertTrue(hasTranslation, @"Translation missing for %@", tzName);
	}
}

- (void)testAllTimeZonesTranslatedForGerman
{
	[self performTestInLanguage:@"de"];
}

- (void)testAllTimeZonesTranslatedForEnglish
{
	[self performTestInLanguage:@"English"];
}

- (void)testAllTimeZonesTranslatedForSpanish
{
	[self performTestInLanguage:@"es"];
}

- (void)testAllTimeZonesTranslatedForFrench
{
	[self performTestInLanguage:@"fr"];
}

- (void)testAllTimeZonesTranslatedForDutch
{
	[self performTestInLanguage:@"nl"];
}

- (void)testAllTimeZonesTranslatedForRussian
{
	[self performTestInLanguage:@"ru"];
}

@end
