# Get all the java files and put them in the package folders ... 
#
#

# the source files are
# 

# the classes are here
setwd("C:/Temp/Java/AAD_IB/build/classes/")

# move the ib api files
system("jar -cvf ib_api.jar com/ib/client/*.class")
file.copy("ib_api.jar", "H:/user/R/Adrian/rib/pkg/inst/java/ib_api.jar",
          overwrite=TRUE)
unlink("ib_api.jar")

# move my class 
system("jar -cvf aad.jar dev/*.class")
file.copy("aad.jar", "H:/user/R/Adrian/rib/pkg/inst/java/aad.jar",
          overwrite=TRUE)
unlink("aad.jar")

# move the source files too ...
file.copy("H:/user/Java/IB/com/ib/client/AnyWrapperMsgGenerator.java",
  "H:/user/R/Adrian/rib/pkg/inst/java/AnyWrapperMsgGenerator.java",
  overwrite=TRUE)

file.copy("H:/user/Java/IB/com/ib/client/EWrapperMsgGenerator.java",
  "H:/user/R/Adrian/rib/pkg/inst/java/EWrapperMsgGenerator.java",
  overwrite=TRUE)

