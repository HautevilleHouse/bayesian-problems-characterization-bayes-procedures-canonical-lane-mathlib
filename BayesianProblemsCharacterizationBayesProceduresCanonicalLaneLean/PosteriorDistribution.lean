import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.Admissibility

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure PosteriorDistributionPackage (L : LossFunctionPackage) where
  sampleSpace : Type u
  parameterSpace : Type v
  priorMeasure : parameterSpace → Prop
  likelihoodFunction : sampleSpace → parameterSpace → Prop
  posteriorMeasure : sampleSpace → parameterSpace → Prop
  conjugatePriorClass : Prop

structure PosteriorDistributionEvidence (L : LossFunctionPackage) (P : PosteriorDistributionPackage L) where
  posteriorMeasureDefined : ∀ (x : P.sampleSpace) (θ : P.parameterSpace), P.posteriorMeasure x θ
  conjugatePriorClassClosed : P.conjugatePriorClass

def PosteriorDistributionClosed (L : LossFunctionPackage) (P : PosteriorDistributionPackage L) : Prop :=
  P.conjugatePriorClass

theorem posterior_distribution_closed_from_evidence (L : LossFunctionPackage) (P : PosteriorDistributionPackage L) (E : PosteriorDistributionEvidence L P) : PosteriorDistributionClosed L P := by
  exact E.conjugatePriorClassClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse