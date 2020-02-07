# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- fix build error when importing using spm.

## [1.1.1] - 2020-02-05

### Fixed
- fix crash on third-party code that doesn't implement default constructor for classes derived from NSObject.

## [1.1.0] - 2020-02-03

### Added
- add optional `identifier` parameter to `UIView.constrain`.
- add `weak(self, in: MyClass.foo)` to avoid retain cycles when passing a member function as an @escaping closure.

## [1.0.5] - 2019-09-21

### Fixed
- mark `simulatedLabelWithLinksInText` unavailable in tvOS, so that interface builder will not show an erroneous error.

## [1.0.4] - 2019-09-16

### Added
- add operator =? to assign iff right side is not nil (useful for wrapping old UIView classes in new SwiftUI wrappers).

## [1.0.2] - 2019-08-22

### Added
- support Swift Package Manager.

## [1.0.1] - 2019-07-23

### Added
- optional priority for UIView constraints.

## [1.0.0]

### Added
- initial release.
