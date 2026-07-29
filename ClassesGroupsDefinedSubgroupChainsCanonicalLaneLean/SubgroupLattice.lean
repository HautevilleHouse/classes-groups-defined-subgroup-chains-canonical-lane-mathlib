import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.GroupClassChain

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubgroupLatticePackage {P : GroupClassChainPackage} where
  latticeOrder : P.underlyingGroup → P.underlyingGroup → Prop
  meetOperation : P.underlyingGroup → P.underlyingGroup → P.underlyingGroup
  joinOperation : P.underlyingGroup → P.underlyingGroup → P.underlyingGroup
  latticeAxioms : Prop
  chainEmbedding : Prop

structure SubgroupLatticeEvidence {P : GroupClassChainPackage}
    (L : SubgroupLatticePackage P) where
  latticeAxiomsClosed : L.latticeAxioms
  chainEmbeddingClosed : L.chainEmbedding

def SubgroupLatticeClosed {P : GroupClassChainPackage}
    (L : SubgroupLatticePackage P) : Prop :=
  L.latticeAxioms ∧ L.chainEmbedding

theorem subgroup_lattice_closed_from_evidence {P : GroupClassChainPackage}
    (L : SubgroupLatticePackage P) (E : SubgroupLatticeEvidence L) :
    SubgroupLatticeClosed L := by
  exact And.intro E.latticeAxiomsClosed E.chainEmbeddingClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse