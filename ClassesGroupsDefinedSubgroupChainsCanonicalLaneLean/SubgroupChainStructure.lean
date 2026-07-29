import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubgroupChainStructure where
  indexType : Type u
  groupCarrier : Type v
  groupMul : groupCarrier → groupCarrier → groupCarrier
  groupInv : groupCarrier → groupCarrier
  groupOne : groupCarrier
  groupMulAssoc : ∀ a b c : groupCarrier, groupMul (groupMul a b) c = groupMul a (groupMul b c)
  groupOneMul : ∀ a : groupCarrier, groupMul groupOne a = a
  groupMulOne : ∀ a : groupCarrier, groupMul a groupOne = a
  groupInvLeft : ∀ a : groupCarrier, groupMul (groupInv a) a = groupOne
  chainIndex : indexType → indexType → Prop
  chainTotal : ∀ i j : indexType, chainIndex i j ∨ chainIndex j i
  chainTrans : ∀ i j k : indexType, chainIndex i j → chainIndex j k → chainIndex i k
  chainAntisymm : ∀ i j : indexType, chainIndex i j → chainIndex j i → i = j
  subgroupAt : indexType → Set groupCarrier
  subgroupContainsOne : ∀ i : indexType, groupOne ∈ subgroupAt i
  subgroupMulClosed : ∀ i : indexType, ∀ a b : groupCarrier, a ∈ subgroupAt i → b ∈ subgroupAt i → groupMul a b ∈ subgroupAt i
  subgroupInvClosed : ∀ i : indexType, ∀ a : groupCarrier, a ∈ subgroupAt i → groupInv a ∈ subgroupAt i
  chainInclusion : ∀ i j : indexType, chainIndex i j → subgroupAt i ⊆ subgroupAt j

structure SubgroupChainEvidence (S : SubgroupChainStructure) where
  chainTotalClosed : ∀ i j : S.indexType, S.chainIndex i j ∨ S.chainIndex j i
  subgroupClosed : ∀ i : S.indexType, IsSubgroup (S.subgroupAt i)
  chainInclusionClosed : ∀ i j : S.indexType, S.chainIndex i j → S.subgroupAt i ⊆ S.subgroupAt j

def SubgroupChainClosed (S : SubgroupChainStructure) : Prop :=
  (∀ i j : S.indexType, S.chainIndex i j ∨ S.chainIndex j i) ∧
  (∀ i : S.indexType, IsSubgroup (S.subgroupAt i)) ∧
  (∀ i j : S.indexType, S.chainIndex i j → S.subgroupAt i ⊆ S.subgroupAt j)

theorem subgroup_chain_closed_from_evidence (S : SubgroupChainStructure)
    (E : SubgroupChainEvidence S) : SubgroupChainClosed S := by
  exact And.intro E.chainTotalClosed (And.intro E.subgroupClosed E.chainInclusionClosed)

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse