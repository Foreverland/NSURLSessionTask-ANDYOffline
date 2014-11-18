@import XCTest;

#import "OHHTTPStubs.h"
#import "OHHTTPStubsResponse+JSON.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPSessionManager+AFOfflineRequest.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];

    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [[OHHTTPStubsResponse responseWithJSONObject:@{@"name" : @"Hello World"}
                                                 statusCode:200
                                                    headers:@{@"Content-Type":@"text/json"}]
                responseTime:15.0f];
    }];
}

- (void)tearDown
{
    [OHHTTPStubs removeAllStubs];

    [super tearDown];
}

@end
