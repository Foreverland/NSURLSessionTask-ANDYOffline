# [WIP] — NSURLSessionTask-ANDYOffline

[![CI Status](http://img.shields.io/travis/NSElvis/NSURLSessionTask-ANDYOffline.svg?style=flat)](https://travis-ci.org/3lvis/NSURLSessionTask-ANDYOffline)

Offline support for HTTP requests (`POST`/`PUT`/`PATCH`/`DELETE`). If the request fails, times out or if you're offline you can save the task on disk and reproduce it later.

### How it works

Saving failed requests:

```objc
[task saveWithParams:params];
```

```objc
[manager POST:path
   parameters:params
      success:^(NSURLSessionDataTask *task, id responseObject) {

          // everything went well, be happy

      } failure:^(NSURLSessionDataTask *task, NSError *error) {

          [task saveWithParams:params];

      }];
```

Retrieving offline requests:

```objc
NSArray *offlineTasks = [NSURLSessionTask offlineTasks];
```

Removing offline requests:

```objc
[task remove];
```

Replaying offline requests (needs a `NSURLSession` or a `AFHTTPSessionManager`):

```objc
[manager replay];
```

## Author

Elvis Nuñez, [elvisnunez@me.com](mailto:elvisnunez@me.com)

## License

**NSURLSessionTask-ANDYOffline** is available under the MIT license. See the [LICENSE](https://github.com/3lvis/NSURLSessionTask-ANDYOffline/blob/master/LICENSE.md) file for more info.
