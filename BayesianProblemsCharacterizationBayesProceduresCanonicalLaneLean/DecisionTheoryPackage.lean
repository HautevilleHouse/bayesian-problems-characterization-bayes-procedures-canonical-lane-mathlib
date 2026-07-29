import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.StatisticalModelPackage

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure DecisionTheoryPackage {M : StatisticalModelPackage} (stat : StatisticalModelClosed M) where
  lossFunction : Prop
  riskFunction : Prop
  decisionRule : Prop
  lossFunctionWellDefined : lossFunction
  riskFunctionComputed : riskFunction
  decisionRuleWellDefined : decisionRule

structure DecisionTheoryEvidence {M : StatisticalModelPackage} {stat : StatisticalModelClosed M}
    (D : DecisionTheoryPackage stat) where
  lossFunctionClosed : D.lossFunction
  riskFunctionClosed : D.riskFunction
  decisionRuleClosed : D.decisionRule

def DecisionTheoryClosed {M : StatisticalModelPackage} {stat : StatisticalModelClosed M}
    (D : DecisionTheoryPackage stat) : Prop :=
  D.lossFunction ∧ D.riskFunction ∧ D.decisionRule

theorem decision_theory_closed_from_evidence {M : StatisticalModelPackage} {stat : StatisticalModelClosed M}
    (D : DecisionTheoryPackage stat) (E : DecisionTheoryEvidence D) : DecisionTheoryClosed D := by
  exact And.intro E.lossFunctionClosed
    (And.intro E.riskFunctionClosed E.decisionRuleClosed)

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse
