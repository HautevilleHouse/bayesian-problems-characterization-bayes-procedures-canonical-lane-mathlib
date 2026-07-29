import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesPosteriorLoss

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesRulePackage {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} (PR : PosteriorRiskPackage PL) where
  bayesRule : actionSpace → observationSpace → ℝ
  minimizesPosteriorRisk : Prop
  admissible : Prop

structure BayesRuleEvidence {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} {PR : PosteriorRiskPackage PL}
    (BR : BayesRulePackage PR) where
  minimizesPosteriorRiskClosed : BR.minimizesPosteriorRisk
  admissibleClosed : BR.admissible

def BayesRuleClosed {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} {PR : PosteriorRiskPackage PL}
    (BR : BayesRulePackage PR) : Prop :=
  BR.minimizesPosteriorRisk ∧ BR.admissible

theorem bayes_rule_closed_from_evidence
    {P : PriorPackage} {L : LikelihoodPackage}
    {PL : PriorLikelihoodPackage P L} {PR : PosteriorRiskPackage PL}
    (BR : BayesRulePackage PR) (E : BayesRuleEvidence BR) :
    BayesRuleClosed BR := by
  exact And.intro E.minimizesPosteriorRiskClosed E.admissibleClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse