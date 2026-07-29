import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.LikelihoodModel

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure BayesPosteriorPackage {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} where
  posteriorMeasure : Type u
  posteriorDensity : Type v
  bayesTheoremApplied : Prop
  consistency : Prop

structure BayesPosteriorEvidence {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} (B : BayesPosteriorPackage L) where
  bayesTheoremAppliedClosed : B.bayesTheoremApplied
  consistencyClosed : B.consistency

def BayesPosteriorClosed {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} (B : BayesPosteriorPackage L) : Prop :=
  B.bayesTheoremApplied ∧ B.consistency

theorem bayes_posterior_closed_from_evidence {P : PriorDistributionPackage}
    {L : LikelihoodModelPackage P} (B : BayesPosteriorPackage L)
    (E : BayesPosteriorEvidence B) : BayesPosteriorClosed B := by
  exact And.intro E.bayesTheoremAppliedClosed E.consistencyClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse