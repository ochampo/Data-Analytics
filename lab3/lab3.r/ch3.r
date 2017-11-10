    install.packages("tidyverse")
    library(tidyverse)
    package::function()
    ggplot2::ggplot()
    ggplot2::mpg
    ?mpg
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = displ, y = hwy))
#ploting     
    ggplot(data = mpg)
#making the data equal to mpg

    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = cyl, y = hwy))
    # cylinder to miles in highway
    ggplot(data = mpg) + 
      geom_point(mapping = aes(x = class, y = drv))
      #the type to  wheel drive
      ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
      #changing the color by type E.g 
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, size = class))
      #changing the size of the display
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
      #changing by shading 
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, shape = class))
      #difftent shape to type of car
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
      #change data to all blue 
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
      mpg##
      View(mpg)
      ## displays all of the data 
      #next three will be about 3.3.1 question 3 
      ggplot(data = mpg) +
        geom_point(mapping = aes(x = displ, y = hwy, color = cty)) 
      ### making some R code with continous values for color 
      ggplot(data = mpg)+
        geom_point(mapping = aes(x = displ , y = hwy , shape = class))
      ### making shapes based off class
      ggplot(data = mpg)+
          geom_point(mapping = aes(x = displ , y = hwy , size = trans))
      ### the size of the plots based on the transmission 
      #### 3.3.1 Question 4 
      ggplot(data = mpg)+
        geom_point(mapping = aes(x = displ , y = hwy , size = trans, color = trans))
      ## what if we add mutliple arguments we can get a mixture of both 
      ?geom_point
      ## for help Use the stroke aesthetic to modify the width of the 
      # border 
      ggplot(mtcars, aes(wt, mpg)) +
        geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)
      #exa  mple from ?geom_point
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy)) + 
        facet_wrap(~ class, nrow = 2)
      #### seprating data based on class 
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy)) + 
        facet_grid(drv ~ cyl)
      ### plot a grid   
          ########################question for 3.5.1
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = drv, y = cyl))
      ### overlaping data does not make a lot of sense
      data <- data_frame(ColA = c(1,2,3,4), ColB = c(5,6,7,8), ColC = c(9,10,11,12), ColD = c(13,14,15,16))
      
      