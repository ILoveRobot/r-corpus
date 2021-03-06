context("text_length")


test_that("text_length can works on sentences", {
    text <- c(a="He said, 'Are you going?' John Shook his head.",
              b="'Are you going?' John asked",
              c="This. Is. A. Long. Sentence!!!",
              d="Why all the shouting??")
    n0 <- text_length(text, "sentences")
    split <- text_split(text, "sentences")
    n <- c(with(split, tapply(index, parent, length)))
    names(n) <- names(text)
    expect_equal(n, n0)
})


test_that("text_length can works on tokens", {
    text <- c(a="He said, 'Are you going?' John Shook his head.",
              b="'Are you going?' John asked",
              c="This. Is. A. Long. Sentence!!!",
              d="Why all the shouting??")
    n0 <- text_length(text, "tokens")
    split <- text_split(text, "tokens")
    n <- c(with(split, tapply(index, parent, length)))
    names(n) <- names(text)
    expect_equal(n, n0)
})


test_that("text_ntype works on types", {
    expect_equal(text_ntype(LETTERS, group = rep(1:2, 13)),
                 c("1" = 13, "2" = 13))

    expect_equal(text_ntype(paste(LETTERS, letters, LETTERS)),
                 rep(1, 26))
})
