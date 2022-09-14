qq_norm <- function(y) {
    #' Compute Slope and Intercept of a Q-Q Plot
    #'
    #' @param y a vector of sample data
    q.sample <- quantile(y, # sample data
                         c(0.25, 0.75), # quantiles to compute (only need 2)
                         names = FALSE, na.rm = TRUE )
    q.theory <- qnorm(c(0.25, 0.75)) # work out theoretical quantiles
    slope <- diff(q.sample) / diff(q.theory) # slope = (y2 - y1)/(x2 - x1)
    intercept <- q.sample[1] - slope * q.theory[1] # intercept = y1 - slope*x1
    list(slope = slope, intercept = intercept)
}
