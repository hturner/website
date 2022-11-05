
df <- data.frame(time = c(1:3, 1:4),
                 groups = rep(c("b", "a"), c(3, 4)),
                 value = rnorm(7))

df %>%
    group_by(groups) %>%
    mutate(lag_value = dplyr::lag(value))


df$lag_value <- c(NA, df$value[-nrow(df)])
df$lag_value[which(!duplicated(df$groups))] <- NA

one <- function(){
    df$lag_value <- c(NA, df$value[-nrow(df)])
    df$lag_value[which(!duplicated(df$groups))] <- NA
    as_tibble(df)
}

two <- function(){
    df %>%
        group_by(groups) %>%
        mutate(lag_value = dplyr::lag(value)) %>%
        ungroup()
}

library("bench")
bench::mark(one(), two())
