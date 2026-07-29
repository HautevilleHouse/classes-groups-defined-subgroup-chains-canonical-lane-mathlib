import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupSeries

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure JordanHolderPackage {P : GroupClassChainPackage}
    (S : SubgroupSeriesPackage P) where
  compositionSeries : SubgroupSeriesPackage P
  refinedByComposition : Prop
  isomorphismOfFactors : Prop

structure JordanHolderEvidence {P : GroupClassChainPackage}
    {S : SubgroupSeriesPackage P} (J : JordanHolderPackage S) where
  refinedByCompositionClosed : J.refinedByComposition
  isomorphismOfFactorsClosed : J.isomorphismOfFactors

def JordanHolderClosed {P : GroupClassChainPackage}
    {S : SubgroupSeriesPackage P} (J : JordanHolderPackage S) : Prop :=
  J.refinedByComposition ∧ J.isomorphismOfFactors

theorem jordan_holder_closed_from_evidence {P : GroupClassChainPackage}
    {S : SubgroupSeriesPackage P} (J : JordanHolderPackage S)
    (E : JordanHolderEvidence J) : JordanHolderClosed J := by
  exact And.intro E.refinedByCompositionClosed E.isomorphismOfFactorsClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse