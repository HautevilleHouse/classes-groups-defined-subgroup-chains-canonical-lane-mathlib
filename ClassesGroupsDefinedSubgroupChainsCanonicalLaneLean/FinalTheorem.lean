import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

def ConstrainedSubgroupChainClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_subgroup_chain_endgame (A : AdmissibleClass) :
    ConstrainedSubgroupChainClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse
