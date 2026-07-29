import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesPriorLikelihood

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure LossFunctionPackage where
  actionSpace : Type u
  loss : actionSpace × parameterSpace → ℝ
  nonnegative : Prop
  convexInAction : Prop

structure PosteriorRiskPackage {P : PriorPackage} {L : LikelihoodPackage}
    (PL : PriorLikelihoodPackage P L) where
  posteriorDistribution : observationSpace → parameterSpace → ℝ
  posteriorRisk : actionSpace → observationSpace → ℝ
  bayesRiskComputed : Prop

structure PosteriorRiskEvidence {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} (PR : PosteriorRiskPackage PL) where
  posteriorDistributionClosed : PR.posteriorDistribution
  posteriorRiskClosed : PR.posteriorRisk
  bayesRiskComputedClosed : PR.bayesRiskComputed

def PosteriorRiskClosed {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} (PR : PosteriorRiskPackage PL) : Prop :=
  PR.bayesRiskComputed

theorem posterior_risk_closed_from_evidence
    {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} (PR : PosteriorRiskPackage PL)
    (E : PosteriorRiskEvidence PR) : PosteriorRiskClosed PR := by
  exact E.bayesRiskComputedClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse