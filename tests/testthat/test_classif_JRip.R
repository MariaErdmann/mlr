context("classif_JRip")

test_that("classif_JRip", {
  requirePackagesOrSkip("RWeka", default.method = "load")

  parset.list = list(
    list(),
    list(F=5),
    list(F=4, N=3),
    list(F=2, O=4)
    )

  old.predicts.list = list()
  old.probs.list = list()

  tt = function (formula, data, subset, ...) {
    RWeka::JRip(formula, data=data[subset,], control=RWeka::Weka_control(..., S = as.integer(runif(1, min=-.Machine$integer.max, max=.Machine$integer.max))))
  }

  tp = function(model, newdata) predict(model, newdata, type="class")

  testCVParsets("classif.JRip", multiclass.df, multiclass.target, tune.train=tt, tune.predict=tp, parset.list=parset.list)
})
