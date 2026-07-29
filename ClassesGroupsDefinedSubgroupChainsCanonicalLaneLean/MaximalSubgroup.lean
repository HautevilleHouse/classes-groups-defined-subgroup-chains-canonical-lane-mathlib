import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainStructure

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure MaximalSubgroup (S : SubgroupChainStructure) where
  maximalIndex : S.indexType
  isProper : S.subgroupAt maximalIndex ≠ Set.univ
  noProperSuperset : ∀ (H : Set S.groupCarrier), IsSubgroup H → S.subgroupAt maximalIndex ⊂ H → H = Set.univ

structure MaximalSubgroupEvidence (S : SubgroupChainStructure) (M : MaximalSubgroup S) where
  isProperClosed : M.isProper
  noProperSupersetClosed : M.noProperSuperset

def MaximalSubgroupClosed (S : SubgroupChainStructure) (M : MaximalSubgroup S) : Prop :=
  M.isProper ∧ M.noProperSuperset

theorem maximal_subgroup_closed_from_evidence (S : SubgroupChainStructure) (M : MaximalSubgroup S)
    (E : MaximalSubgroupEvidence S M) : MaximalSubgroupClosed S M := by
  exact And.intro E.isProperClosed E.noProperSupersetClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse