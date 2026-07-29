import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesPosterior

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure DecisionRulePackage {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} {B : BayesPosteriorPackage L} where
  actionSpace : Type u
  decisionFunction : Type v
  measurability : Prop
  bayesRiskFinite : Prop

structure DecisionRuleEvidence {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} {B : BayesPosteriorPackage L}
    (D : DecisionRulePackage B) where
  measurabilityClosed : D.measurability
  bayesRiskFiniteClosed : D.bayesRiskFinite

def DecisionRuleClosed {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} {B : BayesPosteriorPackage L}
    (D : DecisionRulePackage B) : Prop :=
  D.measurability ∧ D.bayesRiskFinite

theorem decision_rule_closed_from_evidence {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} {B : BayesPosteriorPackage L}
    (D : DecisionRulePackage B) (E : DecisionRuleEvidence D) :
    DecisionRuleClosed D := by
  exact And.intro E.measurabilityClosed E.bayesRiskFiniteClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse