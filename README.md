# wbi_harvesting-carbon

This repository tracks files needed to reproduce the "carbon" scenario simulations in the WBI project.

Note that spades modules are set up as git submodules, so you will need to run `git submodule update --init` from the root of the project directory prior to running the model (this will clone specific commits of the appropriate branches of `spades_ws3_dataInit` and `spades_ws3` modules from their respective GitHub repositories).

Run `01_run-spades.R` to do the thing. Code runs the "base" scenario (you will need to adjust `target.scalefactors` to run "reduced harvest level" scenario).

If you run into any problems, contact [Greg Paradis](mailto:0@01101.io).