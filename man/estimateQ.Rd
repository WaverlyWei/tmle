\name{estimateQ}
\alias{estimateQ}
\title{Initial Estimation of Q portion of the Likelihood}
\usage{
  estimateQ(Y, Z, A, W, Delta, Q, Qbounds, Qform,
    maptoYstar, SL.library, cvQinit, family, id, verbose)
}
\arguments{
  \item{Y}{continuous or binary outcome variable}

  \item{Z}{optional binary indicator for intermediate
  covariate for conrolled direct effect estimation}

  \item{A}{binary treatment indicator, \code{1} -
  treatment, \code{0} - control}

  \item{W}{vector, matrix, or dataframe containing baseline
  covariates}

  \item{Delta}{indicator of missing outcome. \code{1} -
  observed, \code{0} - missing}

  \item{Q}{3-column matrix \code{(Q(A,W), Q(0,W), Q(1,W))}}

  \item{Qbounds}{Bounds on predicted values for \code{Q},
  set to \code{alpha} for logistic fluctuation, or
  \code{range(Y)} if not user-supplied}

  \item{Qform}{regression formula of the form \code{Y~A+W}}

  \item{maptoYstar}{if \code{TRUE} indicates continuous
  \code{Y} values should be shifted and scaled to fall
  between (0,1)}

  \item{SL.library}{specification of prediction algorithms,
  default is (\sQuote{SL.glm}, \sQuote{SL.step},
  \sQuote{SL.DSA.2}) when family=\sQuote{gaussian},
  (\sQuote{SL.glm}, \sQuote{SL.step}, \sQuote{SL.knn},
  \sQuote{SL.DSA.2}) when family = \sQuote{binomial}.  In
  practice, including more prediction algorithms in the
  library improves results.}

  \item{cvQinit}{logical, whether or not to estimate
  cross-validated values for initial \code{Q},
  default=\code{FALSE}}

  \item{family}{family specification for regressions,
  generally \sQuote{gaussian} for continuous oucomes,
  \sQuote{binomial} for binary outcomes}

  \item{id}{subject identifier}

  \item{verbose}{status message printed if set to
  \code{TRUE}}
}
\value{
  \item{Q}{\eqn{nx3} matrix, columns contain the initial
  estimate of \eqn{[Q(A,W)=E(Y|A=a,W), Q(0,W)=E(Y|A=0,W),
  Q(1,W)=E(Y|A=1,W)]}. For controlled direct estimation,
  \eqn{nx5} matrix, \eqn{E(Y|Z,A,W)}, evaluated at
  \eqn{(z,a), (0,0), (0,1), (1,0), (1,1)} on scale of
  linear predictors} \item{Qfamily}{\sQuote{binomial} for
  targeting with logistic fluctuation, \sQuote{gaussian}
  for linear fluctuation} \item{coef}{coefficients for each
  term in working model used for initial estimation of
  \code{Q} if \code{glm} used.} \item{type}{type of
  estimation procedure}
}
\description{
  An internal function called by the \code{tmle} function
  to obtain an initial estimate of the \eqn{Q} portion of
  the likelihood based on user-supplied matrix values for
  predicted values of (counterfactual outcomes)
  \code{Q(0,W),Q(1,W)}, or a user-supplied regression
  formula, or based on a data-adaptively selected
  \code{SuperLearner} fit.  If \code{SuperLearner} is not
  available and values for \code{Q} are not user-supplied,
  estimation is based on a main terms regression using
  \code{glm}.
}
\author{
  Susan Gruber
}
\seealso{
  \code{\link{tmle}}, \code{\link{estimateG}},
  \code{\link{calcParameters}}
}

