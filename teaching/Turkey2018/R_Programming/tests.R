context("log_2 works correctly")

test_that("log_2 returns log to base 2", {
    expect_equal(log_2(2^3), 3)
    expect_equal(log_2(2^0), 0)
})

test_that("negative values give error", {
    expect_error(log_2(2^-1))
})
