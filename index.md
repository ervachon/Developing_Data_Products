---
title       : Developing Data Products Project
subtitle    : October 2015
author      : Eric VACHON
framework   : io2012   # {io2012, html5slides, shower, dzslides, deckjs...}
widgets     : [bootstrap,quiz]   # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
<!--
library(slidify)
setwd("D:\\_MOOC_\\git\\Developing_Data_Products")
publish(title = 'Developing Data Products Project', 'index.html', host = 'rpubs') 
-->

## Aim of the project
hihihi

--- .class #id 

## Histogram screen
![img](./www/screen.png)

--- .class #id  

## Prediction


```r
ggplot(results, aes(x = Reference, y = Prediction)) + geom_point(color='blue') + 
    geom_abline(intercept=0,slope=1,colour='red') + geom_smooth(color = 'green')
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

--- .class #id  
## Links and ressources

[The Shiny App is here :-)](https://ervachon.shinyapps.io/Developing_Data_Products)  
[The RPubs 5-slides is here :-)](http://rpubs.com/ervachon/117127)  
[This HTML  5-slides is here :-)](http://ervachon.github.io/Developing_Data_Products/)  
  
 
