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
        facet_wrap(~ class)
      #### seprating data based on class 
      ################ 3.6
      # left
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy))
      ### bullet point lines 
      # right
      ggplot(data = mpg) + 
        geom_smooth(mapping = aes(x = displ, y = hwy))
      ## a smooth line 
      ggplot(data = mpg) + 
        geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
      # 
      ggplot(data = mpg) +
        geom_smooth(mapping = aes(x = displ, y = hwy))
      
      ggplot(data = mpg) +
        geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
      
      ggplot(data = mpg) +
        geom_smooth(
          mapping = aes(x = displ, y = hwy, color = drv),
          show.legend = FALSE
        )
      #### not sure what this code does
      
      ggplot(data = mpg) + 
        geom_point(mapping = aes(x = displ, y = hwy)) +
        geom_smooth(mapping = aes(x = displ, y = hwy))
      
      ### to display mutlitple geom
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
        geom_point(mapping = aes(color = class)) + 
        geom_smooth()
      ### mutltiple with diffrent graph 
      
      ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
        geom_point(mapping = aes(color = class)) + 
        geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
      
      
      
      