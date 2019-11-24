install.packages("devtools")
devtools::install_github("twitter/BreakoutDetection")

require(BreakoutDetection)
require(readr)
require(dplyr)
require(prophet)
require(ggplot2)


dat <- read_csv(file = "data/bitcoin_closing_price.csv") %>% 
    filter(ds >= as.Date("2016-01-01")) %>% 
    mutate(y = log(y)) %>% 
    arrange(ds)


M0 <- breakout(dat$y, plot = TRUE,
               xlab = "Дата", ylab = "log стоимости ($)")
M0$plot

M0perm <- breakout(dat$y, nperm = 1000)
M0perm

M1 <- breakout(dat$y, method = "multi", plot = TRUE,
               xlab = "Дата", ylab = "log стоимости ($)")
M1$plot


M2 <- breakout(dat$y, method = "multi", plot = TRUE, degree = 0,
               xlab = "Дата", ylab = "log стоимости ($)")
M2$plot
M2$loc


M3 <- breakout(dat$y, method = "multi", plot = TRUE, percent = 0.05,
               xlab = "Дата", ylab = "log стоимости ($)")
M3$plot


M4 <- breakout(dat$y, method = "multi", plot = TRUE, beta = 0.0001,
               xlab = "Дата", ylab = "log стоимости ($)")
M4$plot


M5 <- breakout(dat$y, method = "multi", plot = TRUE, 
               beta = 0.0001, nperm = 1000,
               xlab = "Дата", ylab = "log стоимости ($)")
