# Cargo-ANTS PATH ADAPTOR

Path adaptor is a CHOMP implementation for mobile robots.
It adapts an initial path to avoid obstacles.
This implementation is based on source code from [trychomp][] and is available from [path-adaptor][]


Build and Run GUI:
-------
You need [CMake][], [Eigen][] v3, and [GTK+][] v2.

## Compile:

	catkin_make --only-pkg-with-deps path_adaptor

Basic Class Usage:
------
* Declare a CHOMP object (CHOMP_SE2 or CHOMP) with your selected parameters (passed as arguments in constructor).
* Initialize a path, a starting pose and an ending pose. E.g. use  'setPath' to set any given 
initial path (e.g. computed with a global path planner), 'initStraightLinePath' for a straight line or 'initStackedPath' for a path with all poses stacked at the initial pose.
* Set obstacles with 'setObstacles' (add more with 'addObstacle', obstacles are defined as circles).
* Run CHOMP with 'generatePath' or run a single iteration with 'chompIteration' (you need an initialized path for this step).


This is based on the Covariant Hamiltonian Optimization for Motion Planning [CHOMP][].

[CMake]: http://cmake.org/
[Eigen]: http://eigen.tuxfamily.org/
[GTK+]: http://www.gtk.org/
[CHOMP]: http://www.nathanratliff.com/thesis-research/chomp
[trychomp]: https://github.com/poftwaresatent/trychomp
[path-adaptor]: https://github.com/rafaelvalencia/path-adaptor
