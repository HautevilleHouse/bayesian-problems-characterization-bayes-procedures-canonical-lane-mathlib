import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure PriorDistributionPackage where
  support : Type u
  measure : Type v
  density : Type w
  properPrior : Prop
  conjugateFamily : Prop

structure PriorDistributionEvidence (P : PriorDistributionPackage) where
  properPriorClosed : P.properPrior
  conjugateFamilyClosed : P.conjugateFamily

def PriorDistributionClosed (P : PriorDistributionPackage) : Prop :=
  P.properPrior ∧ P.conjugateFamily

theorem prior_distribution_closed_from_evidence (P : PriorDistributionPackage)
    (E : PriorDistributionEvidence P) : PriorDistributionClosed P := by
  exact And.intro E.properPriorClosed E.conjugateFamilyClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse