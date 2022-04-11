test_that("basic case", {
  mod1 <- mreg( damaged~offset(log(intervisit.time))+esr.init,
                data=public,patid=ptno,print.level=0, iterlim=1000 )
  expect_true(inherits(mod1,"mreg"))
  expect_output(print(mod1), "esr.init")
  expect_output(summary(mod1),"log.disp")

})
