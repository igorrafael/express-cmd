# express-cmd
URL centric API for runing commands (as subprocesses) using an express router

# Motivation
This package is meant for development servers where command line access may be restricted or where it might be desired to batch run commands via HTTP (eg: curl, wget, postman, etc).

I (@igorrafael) do not intend to develop any functionality that I do not need personaly. If you think some funcionality could make this more useful for you, feel free to create an "issue" where we can talk about enhancements.

# Warning
If this package is left active on a production server (which you __should not do__) at the very least ensure that you have some [middleware](http://expressjs.com/en/guide/using-middleware.html) providing security to reduce the chances of misuse.

# Future work
Some functionalities that could make this project more useful. Feel free to submit pull requests with enhancements, listed here or not.

- [x] Initial implementation
- [ ] Tests
	- [ ] Automated testing
	- [x] Linux
	- [ ] OSX
	- [ ] Windows
- [ ] Options from [child_process.spawn](https://nodejs.org/api/child_process.html#child_process_child_process_spawn_command_args_options)
	- [x] cwd
	- [ ] env
	- [ ] detached
- [ ] Process management
	- [ ] Processes termination
	- [ ] Exection log (/stats)
- [x] Error handling
- [ ] Code style
	- [ ] Define beautification via the file `.jsbeautifyrc`
- [ ] Publish to NPM
	- [ ] Test postinstall script
- [ ] Documentation
	- [ ] Usage examples
- [ ] Customization
	- [ ] Blacklisting (preventing commands)
