import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesianDecisionProblem where
  parameterSpace : Type u
  actionSpace : Type v
  prior : parameterSpace → ℝ
  loss : parameterSpace → actionSpace → ℝ
  sampleSpace : Type w
  sampleDistribution : parameterSpace → sampleSpace → ℝ
  decisionRule : sampleSpace → actionSpace

structure BayesianRisk (P : BayesianDecisionProblem) where
  riskFunction : P.parameterSpace → ℝ := λ θ => ∫ s, P.loss θ (P.decisionRule s) * P.sampleDistribution θ s
  bayesRisk : ℝ := ∫ θ, riskFunction θ * P.prior θ

structure AdmissibleBayesProcedure (P : BayesianDecisionProblem) (R : BayesianRisk P) where
  isBayes : R.bayesRisk = (λ d => ∫ θ, ∫ s, P.loss θ (d s) * P.sampleDistribution θ s * P.prior θ).inf (by
    intro d; exact ?_) )
  isAdmissible : ∀ (d' : P.sampleSpace → P.actionSpace), (λ θ => ∫ s, P.loss θ (d' s) * P.sampleDistribution θ s) ≤ R.riskFunction → (λ θ => ∫ s, P.loss θ (d' s) * P.sampleDistribution θ s) = R.riskFunction

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse
