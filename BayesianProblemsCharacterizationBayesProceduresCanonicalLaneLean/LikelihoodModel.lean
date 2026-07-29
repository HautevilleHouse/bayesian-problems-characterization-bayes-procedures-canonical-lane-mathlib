import HautevilleHouse.BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.PriorDistribution

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure LikelihoodModelPackage {P : PriorDistributionPackage} where
  sampleSpace : Type u
  parameterSpace : Type v
  likelihoodFunction : Type w
  dominatedFamily : Prop
  identifiability : Prop

structure LikelihoodModelEvidence {P : PriorDistributionPackage}
    (L : LikelihoodModelPackage P) where
  dominatedFamilyClosed : L.dominatedFamily
  identifiabilityClosed : L.identifiability

def LikelihoodModelClosed {P : PriorDistributionPackage}
    (L : LikelihoodModelPackage P) : Prop :=
  L.dominatedFamily ∧ L.identifiability

theorem likelihood_model_closed_from_evidence {P : PriorDistributionPackage}
    (L : LikelihoodModelPackage P) (E : LikelihoodModelEvidence L) :
    LikelihoodModelClosed L := by
  exact And.intro E.dominatedFamilyClosed E.identifiabilityClosed

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse