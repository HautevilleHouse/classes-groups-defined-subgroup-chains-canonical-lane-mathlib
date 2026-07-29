import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.CompositionSeries

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure JordanHolderTheorem (S : SubgroupChainStructure) where
  series1 : CompositionSeries S
  series2 : CompositionSeries S
  sameLength : series1.length = series2.length
  isomorphicFactors : Prop

structure JordanHolderEvidence (S : SubgroupChainStructure) (JH : JordanHolderTheorem S) where
  sameLengthClosed : JH.sameLength
  isomorphicFactorsClosed : JH.isomorphicFactors

def JordanHolderClosed (S : SubgroupChainStructure) (JH : JordanHolderTheorem S) : Prop :=
  JH.sameLength ∧ JH.isomorphicFactors

theorem jordan_holder_closed_from_evidence (S : SubgroupChainStructure) (JH : JordanHolderTheorem S)
    (E : JordanHolderEvidence S JH) : JordanHolderClosed S JH := by
  exact And.intro E.sameLengthClosed E.isomorphicFactorsClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse