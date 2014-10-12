# fix-travis-ci

Repair annoying repetitive issues with Travis CI

This was created out of frustration with Travis CI for its poor handling of `npm` updates with respect to `node@0.8`

## lol, wut? Why?
`npm` introduced caret notation, requiring `npm` upgrades to install package `dependencies` that use this notation

```yaml
before_install:
  - npm install npm@latest -g
```

`npm` releases `2.0.0` cannot upgrade itself because it now uses caret notation. Thus, voiding the last command

```yaml
before_install:
  - npm install npm@1.x.x -g
```

But this doesn't allow for upgrading to get `npm>1.x.x` features in the future. Right, and what about more future problems?

Proposed solution: Use a hotlinked script for all repos

Bad idea? Probably. But we will make sure to make it transparent during execution for reproducability.

## Getting Started
Install the module with: `npm install fix-travis-ci`

```js
var fix_travis_ci = require('fix-travis-ci');
fix_travis_ci.awesome(); // "awesome"
```

## Documentation
_(Coming soon)_

## Examples
_(Coming soon)_

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint via [grunt](https://github.com/gruntjs/grunt) and test via `npm test`.

## Donating
Support this project and [others by twolfson][gratipay] via [gratipay][].

[![Support via Gratipay][gratipay-badge]][gratipay]

[gratipay-badge]: https://cdn.rawgit.com/gratipay/gratipay-badge/2.x.x/dist/gratipay.png
[gratipay]: https://www.gratipay.com/twolfson/

## Unlicense
As of Oct 12 2014, Todd Wolfson has released this repository and its contents to the public domain.

It has been released under the [UNLICENSE][].

[UNLICENSE]: UNLICENSE
