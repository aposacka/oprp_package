# developing a function for summary statistics and a van aqua theme for figures
# for a package


#-----------------------
# VanAqua theme function
#-----------------------


# the next few lines create a palette based on colors in Van Aqua logo
vanaqua_colors <- c("#CCCCCC", "#FF9933", "#66CC33", "#0099CC", "#00CC99", "#3333FF")

scale_fill_vanaqua <- function(){
  
  structure(list(
    scale_fill_manual(values = vanaqua_colors)
  ))
}

scale_color_discrete_vanaqua <- function(){
  
  structure(list(
    scale_color_manual(values = vanaqua_colors)
  ))
}

  
  
# creating VanAqua theme for graphs
theme_vanaqua <- function(base_size = 2.5,
                          base_family = ""){
  
  color.background = "#FFFCC"
  color.title = "#0099CC"
  color.axis.text = "#0099CC"
  color.axis.title = "#0099CC"
  
  theme_bw(base_size= base_size, base_family = base_family) +
  
    theme(panel.grid.minor = element_blank(), 
          panel.grid.major = element_blank(),
          axis.line = element_line(colour = "black", size = 0.7),
          panel.border = element_blank(),
          axis.ticks = element_blank(),
          axis.text.x = element_text(size = base_size * 6),
          axis.text.y = element_text(size = base_size * 6),
          axis.title.x = element_text(size = base_size * 7, vjust=0),
          axis.title.y = element_text(size = base_size * 7,vjust=1.25),
          legend.text = element_text(size = base_size * 5),
          legend.title = element_text(size = base_size *5),
          plot.title = element_text(size = base_size * 12, color = color.title))
    
}
  
# testing the theme on some data from the diamonds package
# LAUREN can you try to add logo in the right hand corner pls!

p1 <- qplot(carat, data = diamonds[diamonds$color %in%LETTERS[4:7], ],
      geom = "histogram", bins = 30, fill = color)+
  scale_fill_vanaqua()+
  scale_color_discrete_vanaqua()+
  ggtitle ("VanAqua theme")+
  theme_vanaqua()    

library(cowplot)
save_plot(plot = p1, "VanAqua_theme-example.tiff")
