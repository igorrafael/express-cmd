# express-cmd
URL centric API for runing commands (as subprocesses) using an express router

# Motivation
This package is meant for development servers where command line access may be restricted or where it might be desired to batch run commands via HTTP (eg: curl, wget, postman, etc).

# Warning
If this package is left active on a production server at the very least ensure that you have some middleware (TODO:ref) provides security to prevent misuse

# Future work
- [ ] Initial implementation
- [ ] Tests
- [ ] Spawining options
	- [ ] CWD
	- [ ] ...
- [ ] Process management
	- [ ] Processes termination
