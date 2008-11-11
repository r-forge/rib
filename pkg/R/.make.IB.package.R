# 1) build the classes in C:\Temp\Java\AAD_IB\build\classes
#
#

setwd("C:/Temp/Java/AAD_IB/build/classes/")
system("jar -cvf ib_api.jar com/ib/client/*.class")
file.copy("ib_api.jar", "H:/user/R/Adrian/RIB/inst/java/ib_api.jar",
          overwrite=TRUE)
unlink("ib_api.jar")

system("jar -cvf aad.jar dev/*.class")
file.copy("aad.jar", "H:/user/R/Adrian/RIB/inst/java/aad.jar",
          overwrite=TRUE)
unlink("aad.jar")
