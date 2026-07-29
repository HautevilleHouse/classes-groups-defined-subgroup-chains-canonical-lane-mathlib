import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.ClassesGroupsDefinedSubgroupChains

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  -- bridges the chain admissible class to the closure
  match A.object with
  | (C : DefinedSubgroupChain G) => ChainAdmissible G C

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  -- derive from admissible class structure
  exact A.object.conclusion

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse
