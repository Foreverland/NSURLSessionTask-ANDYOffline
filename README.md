# NSURLSessionTask-ANDYOffline

[![CI Status](http://img.shields.io/travis/NSElvis/NSURLSessionTask-ANDYOffline.svg?style=flat)](https://travis-ci.org/NSElvis/NSURLSessionTask-ANDYOffline)

Offline support for your session tasks. If the session has failed, timeout or if you're offline you can save the task on disk and reproduce it later.

### Missing

- [ ] Test `isEqual` between a PUT and a POST request
- [ ] Test `isEqual` between a PUT and a PUT request
- [ ] Support DELETE requests
- [ ] Support removing offline requests
- [ ] Support secure/encrypted storing
- [ ] Support multipart requests
- [ ] Support posting/replaying offline requests
- [ ] Support diffing/mapping requests (if a request was created, updated and deleted it shouldn't do anything)
- [ ] Provide a block to update things when an offline request succeeds

## Usage

To run the example project, clone the repo, and open the `.xcodeproj` from the Demo directory.

## Installation

**NSURLSessionTask-ANDYOffline** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

`pod 'NSURLSessionTask-ANDYOffline'`

## Author

Elvis Nuñez, hello@nselvis.com

## License

**NSURLSessionTask-ANDYOffline** is available under the MIT license. See the LICENSE file for more info.
