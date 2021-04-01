library(reticulate)
#use_virtualenv("./python-venv", required=TRUE)
#use_python("/usr/bin/python3")
#library(raster)
library(SpaDES)

setPaths(modulePath = 'modules',
         inputPath = 'input',
         outputPath = 'output',
         cachePath = 'cache')
paths <- getPaths()
modules <- list('spades_ws3_dataInit', 'spades_ws3')
base.year <- 2020
#basenames <- c("tsa30", "tsa31")
basenames <- c("tsa08", "tsa16", "tsa24", "tsa40", "tsa41")
#basenames <- c("tsa40")
horizon <- 80
times <- list(start = 0, end = horizon - 1)
#basenames <- list(c("tsa30"))
tifPath = "tif"
hdtPath = "hdt"
hdtPrefix = "hdt_"
#stackName = "landscape"
outputs <-data.frame(objectName = "landscape")

params <- list(.globals = list(basenames = basenames,
                               base.year = base.year),
               spades_ws3_dataInit = list(basenames = basenames,
                                          tifPath = tifPath,
                                          hdtPath = hdtPath,
                                          hdtPrefix = hdtPrefix,
                                          .saveInitialTime = 0,
                                          .saveInterval = 1,
                                          .saveObjects = c("landscape"),
                                          .savePath = file.path(paths$outputPath, "landscape")),
               spades_ws3 = list(basenames = basenames,
                                 horizon = 1,
                                 tifPath = tifPath,
                                 hdtPath = hdtPath,
                                 hdtPrefix = hdtPrefix))
#params <- list(.globals = list(basenames = basenames))

sim <- simInit(paths=paths, modules=modules, times=times, params=params, outputs=outputs)

simOut <- spades(sim, debug=TRUE)

