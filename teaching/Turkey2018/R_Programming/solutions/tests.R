context("qq_norm works correctly")

test_that("works correctly for standard normal", {
    expect_equal(qq_norm(rnorm(100000)), list(slope = 1, intercept = 0),
                 tol = 0.01)
    expect_equal(qq_norm(rnorm(100000), sd = 1/2), list(slope = 2, intercept = 0),
                 tol = 0.01)
    expect_equal(qq_norm(rnorm(100000), mean = 2), list(slope = 1, intercept = -2),
                 tol = 0.01)
})
