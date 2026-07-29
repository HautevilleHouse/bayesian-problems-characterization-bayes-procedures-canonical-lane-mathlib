import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesRisk

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesRulePackage {L : LossFunctionPackage} {B : BayesRiskPackage L} where
  decisionRule : Type u
  bayesRuleOptimality : Prop
  minimizesPosteriorRisk : Prop
  mapToDecision : decisionRule → L.decisionSpace

structure BayesRuleEvidence {L : LossFunctionPackage} {B : BayesRiskPackage L} (R : BayesRulePackage L B) where
  bayesRuleOptimalityClosed : R.bayesRuleOptimality
  minimizesPosteriorRiskClosed : R.minimizesPosteriorRisk

def BayesRuleClosed {L : LossFunctionPackage} {B : BayesRiskPackage L} (R : BayesRulePackage L B) : Prop :=
  R.bayesRuleOptimality ∧ R.minimizesPosteriorRisk

theorem bayes_rule_closed_from_evidence {L : LossFunctionPackage} {B : BayesRiskPackage L} (R : BayesRulePackage L B) (E : BayesRuleEvidence R) : BayesRuleClosed R := by
  exact And.intro E.bayesRuleOptimalityClosed E.minimizesPosteriorRiskClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse