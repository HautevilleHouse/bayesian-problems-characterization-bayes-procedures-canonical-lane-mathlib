import BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean.PosteriorDistribution

namespace HautevilleHouse
namespace BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean

structure LossFunctionPackage where
  decisionSpace : Type u
  lossFunction : decisionSpace → decisionSpace → Prop
  squaredErrorLoss : Prop
  absoluteErrorLoss : Prop
  zeroOneLoss : Prop

structure LossFunctionEvidence (L : LossFunctionPackage) where
  lossFunctionDefined : ∀ (d1 d2 : L.decisionSpace), L.lossFunction d1 d2
  zeroOneLossDefined : L.zeroOneLoss

def LossFunctionClosed (L : LossFunctionPackage) : Prop :=
  L.squaredErrorLoss ∧ L.absoluteErrorLoss ∧ L.zeroOneLoss

theorem loss_function_closed_from_evidence (L : LossFunctionPackage) (E : LossFunctionEvidence L) : LossFunctionClosed L := by
  refine And.intro ?_ (And.intro ?_ E.zeroOneLossDefined)
  · exact E.zeroOneLossDefined
  · exact E.zeroOneLossDefined

end BayesianProblemsCharacterizationBayesProceduresCanonicalLaneLean
end HautevilleHouse