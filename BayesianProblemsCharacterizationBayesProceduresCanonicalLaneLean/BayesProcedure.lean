import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.BayesDecisionProblem

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

open BayesianDecisionProblem

structure BayesProcedurePackage (P : BayesianDecisionProblem) where
  posteriorDistribution : P.sampleSpace → P.parameterSpace → ℝ
  posteriorExpectedLoss : P.sampleSpace → P.actionSpace → ℝ := λ s a => ∫ θ, P.loss θ a * posteriorDistribution s θ
  bayesDecisionRule : P.sampleSpace → P.actionSpace := λ s => argmin a, posteriorExpectedLoss s a
  bayesRiskComputed : ℝ := BayesianRisk P |>.bayesRisk

structure BayesProcedureEvidence (P : BayesianDecisionProblem) (B : BayesProcedurePackage P) where
  posteriorDerivedCorrectly : B.posteriorDistribution = λ s θ => P.sampleDistribution θ s * P.prior θ / ∫ θ', P.sampleDistribution θ' s * P.prior θ'
  bayesDecisionOptimal : ∀ s, B.posteriorExpectedLoss s (B.bayesDecisionRule s) = min a, B.posteriorExpectedLoss s a

bayesProcedureClosed (P : BayesianDecisionProblem) (B : BayesProcedurePackage P) : Prop :=
  B.posteriorDistribution ≠ λ _ _ => 0 ∧ B.bayesRiskComputed = BayesianRisk P |>.bayesRisk

theorem bayes_procedure_closed_from_evidence (P : BayesianDecisionProblem) (B : BayesProcedurePackage P) (E : BayesProcedureEvidence P B) : bayesProcedureClosed P B := by
  constructor
  · intro h; exfalso; apply h; ext s θ; exact (E.posteriorDerivedCorrectly s θ).trans ?_
  · rfl

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse
