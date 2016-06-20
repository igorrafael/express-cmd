# express-cmd
URL centric API for runing commands (as subprocesses) using an express router

# Motivation
This package is meant for development servers where command line access may be restricted or where it might be desired to batch run commands via HTTP (eg: curl, wget, postman, etc).

I (@igorrafael) do not intend to develop any functionality that I do not need personaly. If you think some funcionality could make this more useful for you, feel free to create an "issue" where we can talk about enhancements.

# Warning
If this package is left active on a production server at the very least ensure that you have some middleware (TODO:ref) provides security to prevent misuse

# Future work
Some functionalities that could make this project more useful. Feel free to submit pull requests with any of these.

- [x] Initial implementation
- [ ] Tests
- [ ] Spawining options
	- [x] cwd
	- [ ] ...
- [ ] Process management
	- [ ] Processes termination
- [ ] .jsbeautifyrc
