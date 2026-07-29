import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure SubgroupChainObject where
  carrier : Type
  groupOperation : carrier → carrier → carrier
  identity : carrier
  inverse : carrier → carrier
  groupAxioms : Prop

structure SubgroupChainAdmittedObject where
  object : SubgroupChainObject
  chainDefined : Prop
  chainAscending : Prop
  chainTerminates : Prop
  conclusion : chainTerminates

def SubgroupChainWitnessClosed (O : SubgroupChainAdmittedObject) : Prop :=
  O.chainTerminates

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse