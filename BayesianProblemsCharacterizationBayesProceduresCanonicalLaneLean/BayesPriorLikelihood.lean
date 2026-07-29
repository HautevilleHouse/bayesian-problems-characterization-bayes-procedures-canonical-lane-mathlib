import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure PriorPackage where
  priorFamily : Type u
  priorMeasure : priorFamily → (parameterSpace → ℝ)
  properPrior : Prop
  conjugateFamily : Prop

structure LikelihoodPackage where
  observationSpace : Type v
  likelihoodFunction : observationSpace → parameterSpace → ℝ
  dominatedFamily : Prop
  identifiable : Prop

structure PriorLikelihoodPackage (P : PriorPackage) (L : LikelihoodPackage) where
  priorSelected : P.priorMeasure
  likelihoodUsed : L.likelihoodFunction
  posteriorDerived : observationSpace → parameterSpace → ℝ
  bayesTheoremApplied : Prop

structure PriorLikelihoodEvidence {P : PriorPackage} {L : LikelihoodPackage}
    (PL : PriorLikelihoodPackage P L) where
  priorSelectedClosed : PL.priorSelected
  likelihoodUsedClosed : PL.likelihoodUsed
  posteriorDerivedClosed : PL.posteriorDerived
  bayesTheoremAppliedClosed : PL.bayesTheoremApplied

def PriorLikelihoodClosed {P : PriorPackage} {L : LikelihoodPackage}
    (PL : PriorLikelihoodPackage P L) : Prop :=
  PL.bayesTheoremApplied

theorem prior_likelihood_closed_from_evidence
    {P : PriorPackage} {L : LikelihoodPackage}
    (PL : PriorLikelihoodPackage P L) (E : PriorLikelihoodEvidence PL) :
    PriorLikelihoodClosed PL := by
  exact E.bayesTheoremAppliedClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse