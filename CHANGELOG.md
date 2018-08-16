# nginx-php-fpm
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2018-08-16
### Added
- Add configuration refer to trusted proxies of CloudFlare | 505495b0
### Changed
- Set keepalive off on health check path | 0a49ba59

## [1.0.2] - 2018-08-12
### Changed
- Rename entrypoint, and some envs | a0ca353c
### Fixed
- Fix PHP configuration to set $_ENV | 76fdf12f

## [1.0.1] - 2018-08-10
### Fixed
- Add missing $query_string to index.php | 1e5849c5
- Fix the health check path to match exactly | 396f4097

## [1.0.0] - 2018-08-02
### Added
- Initial Release!
